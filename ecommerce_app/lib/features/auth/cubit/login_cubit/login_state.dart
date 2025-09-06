
abstract class LoginState {}

class Loginitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  // final UserModel user;
  // LoginSuccess(this.user);
}

class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}

class ChangePasswordState extends LoginState {}
