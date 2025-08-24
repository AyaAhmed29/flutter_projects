import 'package:todo_app/feature/auth/data/model/user_model.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  final UserModel user;

  UserSuccess({required this.user});
}

final class UserFailure extends UserState {
  final String message;

  UserFailure({required this.message});
}
