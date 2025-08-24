import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/auth/data/model/user_model.dart';
import 'package:todo_app/feature/home/data/repo/home_repo.dart';
import 'package:todo_app/feature/home/view/cubit/user_cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo = HomeRepo();

  Future<void> getUser({UserModel? userModel}) async {
    if (userModel != null) {
      emit(UserSuccess(user: userModel));
      return;
    }

    emit(UserLoading());
    final result = await homeRepo.getUser();
    result.fold(
      (failure) {
        emit(UserFailure(message: failure));
      },
      (user) {
        emit(UserSuccess(user: user));
      },
    );
  }
}
