import 'package:clean_architecture/core/constants/end_points.dart';
import 'package:clean_architecture/core/network/dio_catch_error_config.dart';
import 'package:clean_architecture/core/network/dio_config.dart';
import 'package:clean_architecture/data/model/users_model.dart';
import 'package:dio/dio.dart';

class ProjectService {
  Future<dynamic> getUsers() async {
    try {
      Response response = await DioConfig.createRequest().get(ProjectEndPointUrls.users);
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => UsersModel.fromJson(e)).toList();
      } else {
        return response.statusMessage.toString();
      }
    } on  DioError catch (e) {
      return DioCatchError.catchError(e);
    }
  }
}
