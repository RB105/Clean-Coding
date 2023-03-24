import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

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

class HomeCompleteState extends HomeState {
  List<UsersModel> data;
  HomeCompleteState(this.data);
}
