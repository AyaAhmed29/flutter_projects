import 'package:ecommerce_app/features/auth/cubit/register_cubit/register_state.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(Registeritial());
  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);
  bool passwordSecure = true;
  bool confirmPasswordSecure = true;
  var usernameController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void passwordVisibility() {
    passwordSecure = !passwordSecure;
    emit(PasswordState());
  }

  void confirmPasswordVisibility() {
    confirmPasswordSecure = !confirmPasswordSecure;
    emit(ConfirmPassworState());
  }

  onTapregister() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(RegisterLoading());
    AuthRepo repo = AuthRepo();
    var response = await repo.register(
      phone: phoneController.text,
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    response.fold(
      (String error) => emit(RegisterFailure(error)),
      (userModel) => emit(RegisterSuccess()),
    );
  }
}
