part of 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState()) {
    getUsers();
  }

  HomeRepository repository = HomeRepository();

  Future<void> getUsers() async {
    emit(HomeLoadingState());
    await repository.getUsers().then((dynamic response) {
      if (response is Box<UsersModel>) {
        emit(HomeCompleteState(response.values.toList()));
      } else {
        emit(HomeErrorState(response));
      }
    });
  }
}
