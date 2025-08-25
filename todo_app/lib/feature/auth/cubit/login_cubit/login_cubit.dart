import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/auth/data/repos/auth_repo.dart';
import 'package:todo_app/feature/auth/cubit/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(Loginitial());

  final AuthRepo authRepo;
  static LoginCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passwordSecure = true;

  void changePasswordVisibility() {
    passwordSecure = !passwordSecure;
    emit(ChangePasswordState());
  }

  onLoginPressed() async {
    if (!formKey.currentState!.validate()) return;
    emit(LoginLoading());
    var loginResponse = await authRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );

    loginResponse.fold(
      (error) => emit(LoginFailure(error)),
      (userModel) => emit(LoginSuccess(userModel)),
    );
  }
}
