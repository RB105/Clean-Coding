import 'package:dio/dio.dart';

class DioConfig {
  static Dio createRequest() {
    Dio dio = Dio(BaseOptions(
        validateStatus: (int? statusCode) {
          if (statusCode != null) {
            if (statusCode >= 100 && statusCode <= 511) {
              return true;
            } else {
              return false;
            }
          } else {
            return false;
          }
        },
        receiveDataWhenStatusError: true));

    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 5);
    dio.options.sendTimeout = const Duration(seconds: 5);
    return dio;
  }
}
