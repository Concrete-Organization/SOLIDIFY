import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'token_interceptor.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class DioFactory {
  static PersistCookieJar? _cookieJar;
  static Dio? _authenticatedDio;
  static Dio? _publicDio;

  static Future<void> initCookieJar() async {
    final directory = await getApplicationDocumentsDirectory();
    final cookiePath = '${directory.path}/.cookies/';
    _cookieJar = PersistCookieJar(
      storage: FileStorage(cookiePath),
      ignoreExpires: false,
    );
  }

  static Dio get publicDio {
    if (_publicDio == null) {
      _publicDio = Dio();
      _publicDio!
        ..options.connectTimeout = const Duration(seconds: 30)
        ..options.receiveTimeout = const Duration(seconds: 30);
      _publicDio!.interceptors.addAll([
        PrettyDioLogger(
          requestHeader: true,
          responseHeader: true,
          responseBody: true,
          requestBody: true,
        ),
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
        CookieManager(_cookieJar!),
        PrettyDioLogger(
          requestHeader: true,
          responseHeader: true,
          responseBody: true,
          requestBody: true,
        ),
        TokenInterceptor(_authenticatedDio!),
      ]);
    }
    return _authenticatedDio!;
  }
}