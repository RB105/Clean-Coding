import 'dart:io';

import 'package:clean_architecture/data/model/users_model.dart';
import 'package:clean_architecture/data/service/project_service.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HomeRepository {
  // Instance for comfort
  ProjectService service = ProjectService();

  // Box
  Box<UsersModel>? usersBox;

  Future<dynamic> getUsers() async {
    // Higher order function
    return await service.getUsers().then((dynamic response) async {
      if (response is List<UsersModel>) {
        await openBox();
        await putBox(response);
        return usersBox;
      } else {
        return response;
      }
    });
  }

  Future<void> openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    usersBox = await Hive.openBox('usersBox');
  }

  Future<void> putBox(List<UsersModel> users) async {
    await usersBox!.clear();
    for (int i = 0; i < users.length; i++) {
      await usersBox!.add(users[i]);
    }
  }

  static void registerAdapters() {
    Hive.registerAdapter(UsersModelAdapter());
    Hive.registerAdapter(AddressAdapter());
    Hive.registerAdapter(GeoAdapter());
    Hive.registerAdapter(CompanyAdapter());
  }
}
