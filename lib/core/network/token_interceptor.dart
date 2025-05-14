import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:solidify/core/helpers/logout_helper.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/core/network/refresh_token_model.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/main.dart';
import 'api_constants.dart';

class TokenInterceptor extends Interceptor {
  final Dio _dio;
  bool _isRefreshing = false;
  bool _isDialogShown = false;
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

    if (expiresOn.isAfter(now)) {
      options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    }

    if (refreshExpires.isBefore(now)) {
      _showSessionExpiredDialog();
      return handler.reject(DioException(
        requestOptions: options,
        error: 'Session expired. Please login again.',
      ));
    }

    _requestsQueue.add(options);
    if (!_isRefreshing) {
      _isRefreshing = true;
      try {
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
        _isRefreshing = false;
        _requestsQueue.clear();
        _showSessionExpiredDialog();
        handler.reject(DioException(requestOptions: options, error: e));
      }
    } else {
      handler.reject(
        DioException(
          requestOptions: options,
          error: 'Waiting for token refresh',
        ),
        true,
      );
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_isDialogShown) {
      _showSessionExpiredDialog();
      handler.reject(err);
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

  Future<void> _logoutUser() async {
    await LogoutHelper.logout();
  }

  void _showSessionExpiredDialog() {
    if (_isDialogShown) return;
    _isDialogShown = true;

    final context = navigatorKey.currentContext;
    if (context != null) {
      showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) {
          return CupertinoAlertDialog(
            title: const Text(
              'Session Expired',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
            content: const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                'Your session has expired. Please login again.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () async {
                  _isDialogShown = false;
                  Navigator.of(dialogContext).pop();
                  await _logoutUser();
                  navigatorKey.currentState?.pushNamedAndRemoveUntil(
                    Routes.loginScreen,
                        (route) => false,
                  );
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: CupertinoColors.activeBlue,
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
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