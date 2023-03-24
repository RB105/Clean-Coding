import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture/data/service/project_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../data/model/users_model.dart';
import '../data/repository/home_repository.dart';

part 'home_cubit.dart';


abstract class HomeState {
  HomeState();
}

class HomeInitialState extends HomeState {
  HomeInitialState();
}

class HomeLoadingState extends HomeState {
  HomeLoadingState();
}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
}

class HomeOfflineState extends HomeState {
  List<UsersModel> box;
  HomeOfflineState(this.box);
}

class HomeOnlineState extends HomeState{
  List<UsersModel> data;
  HomeOnlineState(this.data);
}
