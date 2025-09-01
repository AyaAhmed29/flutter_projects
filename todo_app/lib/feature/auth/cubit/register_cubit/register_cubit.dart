import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/feature/auth/data/repos/auth_repo.dart';
import 'package:todo_app/feature/auth/cubit/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(Registeritial());
  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);
  bool passwordSecure = true;
  bool confirmPasswordSecure = true;
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  XFile? userImage;

  onRegisterPressed() async {
    if (!formKey.currentState!.validate()) return;

    emit(RegisterLoading());
    AuthRepo repo = AuthRepo();
    var response = await repo.register(
      emailController.text,
      passwordController.text,
      usernameController.text,
      userImage != null ? File(userImage!.path) : null,
    );
    response.fold(
      (error) => emit(RegisterFailure(error)),
      (userModel) => emit(RegisterSuccess(userModel)),
    );
  }

  void changePasswordVisibility() {
    passwordSecure = !passwordSecure;
    emit(ChangePasswordState());
  }

  void changeConfirmPasswordVisibility() {
    confirmPasswordSecure = !confirmPasswordSecure;
    emit(ChangeConfirmPassworState());
  }
}
