import 'package:dio/dio.dart';

class DioCatchError {
  static String catchError(DioError e){
    switch (e.type) {
      case DioErrorType.connectionTimeout:
      return "Connection timeout";
      case DioErrorType.sendTimeout:
      return "Send timeout";
      case DioErrorType.receiveTimeout:
      return "Receive timeout";
      case DioErrorType.unknown:
      return "No internet connection";
      default:
       return "Some thing went wrong";
    }
  }
}