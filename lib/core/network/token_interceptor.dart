import 'package:dio/dio.dart';
import 'package:solidify/core/helpers/logout_helper.dart';
import 'package:solidify/core/network/refresh_token_model.dart';
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

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      print('Server returned 401, attempting token refresh');
      final refreshToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.refreshToken);
      try {
        final newTokens = await _refreshToken(refreshToken);
        await SharedPrefHelper.setSecuredString(SharedPrefKeys.accessToken, newTokens.model.accessToken);
        await SharedPrefHelper.setSecuredString(SharedPrefKeys.refreshToken, newTokens.model.refreshToken);
        await SharedPrefHelper.setSecuredString(SharedPrefKeys.expiresOn, newTokens.model.expiresOn.toIso8601String());
        await SharedPrefHelper.setSecuredString(SharedPrefKeys.refreshTokenExpiration, newTokens.model.refreshTokenExpiration.toIso8601String());
        err.requestOptions.headers['Authorization'] = 'Bearer ${newTokens.model.accessToken}';
        final response = await _dio.fetch(err.requestOptions);
        handler.resolve(response);
      } catch (e) {
        _logoutUser();
        handler.next(err);
      }
    } else {
      handler.next(err);
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
    await LogoutHelper.logout();
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