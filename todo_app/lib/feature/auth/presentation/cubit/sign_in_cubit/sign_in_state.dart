import 'package:todo_app/feature/auth/domain/entites/user_entity.dart';

abstract class LoginState {}

class Loginitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserEntity user;
  LoginSuccess(this.user);
}

class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}

class ChangePasswordState extends LoginState {}
