import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'token_interceptor.dart';

class DioFactory {
  static Dio? _authenticatedDio;
  static Dio? _publicDio;

  static Dio get publicDio {
    if (_publicDio == null) {
      _publicDio = Dio();
      _publicDio!
        ..options.connectTimeout = const Duration(seconds: 30)
        ..options.receiveTimeout = const Duration(seconds: 30);
      _publicDio!.interceptors.addAll([
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
        TokenInterceptor(),
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
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
        TokenInterceptor(),
      ]);
    }
    return _authenticatedDio!;
  }
}