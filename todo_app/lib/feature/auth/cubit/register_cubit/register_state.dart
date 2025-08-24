
import 'package:todo_app/feature/auth/data/model/user_model.dart';

abstract class RegisterState {}

class Registeritial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final UserModel user;
  RegisterSuccess(this.user);
}

class RegisterFailure extends RegisterState {
  final String errorMessage;
  RegisterFailure(this.errorMessage);
}
class ChangePasswordState extends RegisterState {}
class ChangeConfirmPassworState extends RegisterState {}
