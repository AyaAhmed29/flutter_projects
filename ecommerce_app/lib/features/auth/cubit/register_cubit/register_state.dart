

abstract class RegisterState {}

class Registeritial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
 
}

class RegisterFailure extends RegisterState {
  final String errorMessage;
  RegisterFailure(this.errorMessage);
}
class PasswordState extends RegisterState {}
class ConfirmPassworState extends RegisterState {}
