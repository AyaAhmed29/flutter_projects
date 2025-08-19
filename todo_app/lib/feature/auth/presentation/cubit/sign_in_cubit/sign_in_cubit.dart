import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/auth/data/repos/auth_repo.dart';
import 'package:todo_app/feature/auth/presentation/cubit/sign_in_cubit/sign_in_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(Loginitial());

  final AuthRepo authRepo;
  Future<void> login(String email, String pass) async {
    emit(LoginLoading());
    try {
      final result = await authRepo.login(email, pass);
      result.fold(
        (failure) => emit(LoginFailure(failure)),
        (user) => emit(LoginSuccess(user)),
      );
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  static LoginCubit get(context) => BlocProvider.of(context);

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  bool passwordSecure = true;

  void changePasswordVisibility() {
    passwordSecure = !passwordSecure;
   emit(ChangePasswordState());
  }
}
