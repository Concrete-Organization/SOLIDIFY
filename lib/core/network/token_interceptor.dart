import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/core/network/refresh_token_model.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/main.dart';

import '../helpers/shared_pref_helper.dart';
import 'api_constants.dart';

class TokenInterceptor extends Interceptor {
  final Dio _dio;
  bool _isRefreshing = false;
  final List<RequestOptions> _requestsQueue = [];

  TokenInterceptor(this._dio);

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    if (_shouldSkipInterceptor(options.path)) {
      return handler.next(options);
    }

    final accessToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessToken);
    final expiresOnStr = await SharedPrefHelper.getSecuredString(SharedPrefKeys.expiresOn);
    final refreshToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.refreshToken);
    final refreshExpiresStr = await SharedPrefHelper.getSecuredString(SharedPrefKeys.refreshTokenExpiration);

    if (expiresOnStr.isEmpty || refreshExpiresStr.isEmpty) {
      return handler.next(options);
    }

    final expiresOn = DateTime.parse(expiresOnStr);
    final refreshExpires = DateTime.parse(refreshExpiresStr);
    final now = DateTime.now().toUtc();

    print('Token: $accessToken');
    print('Expires On: $expiresOnStr, Current Time: $now');

    if (expiresOn.isAfter(now)) {
      options.headers['Authorization'] = 'Bearer $accessToken';
      print('Token is valid, proceeding with request');
      return handler.next(options);
    }

    if (refreshExpires.isBefore(now)) {
      print('Refresh token expired, logging out');
      _logoutUser();
      return handler.reject(DioException(
        requestOptions: options,
        error: 'Session expired. Please login again.',
      ));
    }

    _requestsQueue.add(options);
    if (!_isRefreshing) {
      _isRefreshing = true;
      try {
        print('Token expired, attempting refresh with $refreshToken');
        final newTokens = await _refreshToken(refreshToken);

        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.accessToken,
          newTokens.model.accessToken,
        );
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.refreshToken,
          newTokens.model.refreshToken,
        );
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.expiresOn,
          newTokens.model.expiresOn.toIso8601String(),
        );
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.refreshTokenExpiration,
          newTokens.model.refreshTokenExpiration.toIso8601String(),
        );

        print('Refresh successful: ${newTokens.model.accessToken}');
        _isRefreshing = false;
        for (var request in _requestsQueue) {
          request.headers['Authorization'] = 'Bearer ${newTokens.model.accessToken}';
          await _dio.request(
            request.path,
            data: request.data,
            queryParameters: request.queryParameters,
            options: Options(method: request.method, headers: request.headers),
          );
        }
        _requestsQueue.clear();
        handler.next(options);
      } catch (e) {
        print('Refresh failed: $e');
        _isRefreshing = false;
        _requestsQueue.clear();
        _logoutUser();
        handler.reject(DioException(requestOptions: options, error: e));
      }
    } else {
      handler.reject(DioException(
        requestOptions: options,
        error: 'Waiting for token refresh',
      ), true);
    }
  }

  Future<RefreshTokenResponseModel> _refreshToken(String refreshToken) async {
    final dio = Dio();
    final response = await dio.post(
      '${ApiConstants.apiBaseUrl}${ApiConstants.refreshToken}',
      data: {'refreshToken': refreshToken},
    );
    return RefreshTokenResponseModel.fromJson(response.data);
  }

  void _logoutUser() async {
    await SharedPrefHelper.clearAllSecuredData();
    await SharedPrefHelper.clearAllData();
    await SharedPrefHelper.setData(SharedPrefKeys.isLoggedIn, false);
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      Routes.loginScreen,
          (route) => false,
    );
  }

  bool _shouldSkipInterceptor(String path) {
    final skipPaths = [
      ApiConstants.login,
      ApiConstants.engineerSignUP,
      ApiConstants.companySignUp,
      ApiConstants.forgetPassword,
      ApiConstants.verifyOtp,
      ApiConstants.resetPassword,
    ];
    return skipPaths.any((p) => path.contains(p));
  }
}
// class TokenInterceptor extends Interceptor{
//   static final TokenInterceptor _instance = TokenInterceptor._internal();
//   final Dio _dio = Dio();
//   final FlutterSecureStorage _storage = const FlutterSecureStorage();
//
//   factory TokenInterceptor() {
//     return _instance;
//   }
//
//   TokenInterceptor._internal() {
//     _dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) async {
//         final accessToken = await _storage.read(key: 'accessToken');
//         if (accessToken != null) {
//           options.headers['Authorization'] = 'Bearer $accessToken';
//         }
//         return handler.next(options);
//       },
//       onError: (error, handler) async {
//         if (error.response?.statusCode == 401) {
//           final refreshToken = await _storage.read(key: 'refreshToken');
//           if (refreshToken != null) {
//             try {
//               final newAccessToken = await _refreshToken(refreshToken);
//               await _storage.write(key: 'accessToken', value: newAccessToken);
//
//               error.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
//               final response = await _dio.fetch(error.requestOptions);
//               return handler.resolve(response);
//             } catch (e) {
//               await _storage.deleteAll();
//               navigatorKey.currentState?.pushNamedAndRemoveUntil(
//                 Routes.loginScreen,
//                 (route) => false,
//               );
//             }
//           }
//         }
//         return handler.next(error);
//       },
//     ));
//   }
//
//   Future<String> _refreshToken(String refreshToken) async {
//     final response = await ApiService(_dio)
//         .refreshToken(RefreshTokenRequestModel(refreshToken: refreshToken));
//
//     return response.model.accessToken;
//   }
//   ApiService get apiService => ApiService(_dio);
// }
