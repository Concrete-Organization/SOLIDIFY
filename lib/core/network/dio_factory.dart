import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'token_interceptor.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class DioFactory {
  static final CookieJar _cookieJar = CookieJar();

  static Dio? _authenticatedDio;
  static Dio? _publicDio;

  static Dio get publicDio {
    if (_publicDio == null) {
      _publicDio = Dio();
      _publicDio!
        ..options.connectTimeout = const Duration(seconds: 30)
        ..options.receiveTimeout = const Duration(seconds: 30);
      _publicDio!.interceptors.addAll([
        CookieManager(_cookieJar),
        PrettyDioLogger(),
        TokenInterceptor(_publicDio!),
      ]);
    }
    return _publicDio!;
  }

  static Dio get authenticatedDio {
    if (_authenticatedDio == null) {
      _authenticatedDio = Dio();
      _authenticatedDio!
        ..options.connectTimeout = const Duration(seconds: 30)
        ..options.receiveTimeout = const Duration(seconds: 30);
      _authenticatedDio!.interceptors.addAll([
        CookieManager(_cookieJar),
        PrettyDioLogger(),
        TokenInterceptor(_authenticatedDio!),
      ]);
    }
    return _authenticatedDio!;
  }
}