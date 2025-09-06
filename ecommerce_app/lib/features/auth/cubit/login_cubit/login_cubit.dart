import 'package:ecommerce_app/features/auth/cubit/login_cubit/login_state.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(Loginitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passwordSecure = true;

  void changePasswordVisibility() {
    passwordSecure = !passwordSecure;
    emit(ChangePasswordState());
  }

  onTalogin() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(LoginLoading());
    AuthRepo repo = AuthRepo();
    var response = await repo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    response.fold(
      (String error) => emit(LoginFailure(error)),
      (userModel) => emit(LoginSuccess()),
    );
  }
}
