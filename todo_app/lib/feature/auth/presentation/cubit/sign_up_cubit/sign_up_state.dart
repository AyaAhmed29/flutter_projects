
import 'package:todo_app/feature/auth/domain/entites/user_entity.dart';

abstract class RegisterState {}

class Registeritial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final UserEntity user;
  RegisterSuccess(this.user);
}

class RegisterFailure extends RegisterState {
  final String errorMessage;
  RegisterFailure(this.errorMessage);
}
class ChangePasswordState extends RegisterState {}
class ChangeConfirmPassworState extends RegisterState {}
