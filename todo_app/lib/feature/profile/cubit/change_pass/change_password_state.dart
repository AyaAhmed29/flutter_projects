part of 'change_password_cubit.dart';

sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}

final class ChangePasswordSuccess extends ChangePasswordState {}

final class ChangePasswordFailure extends ChangePasswordState {
  final String errorMessage;
  ChangePasswordFailure(this.errorMessage);

}
final class OldPasswordState extends ChangePasswordState {}
final class NewPasswordPassworState extends ChangePasswordState {}
final class ConfirmNewPassworState extends ChangePasswordState {}

