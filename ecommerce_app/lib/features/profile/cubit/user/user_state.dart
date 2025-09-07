import 'package:ecommerce_app/features/auth/data/model/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  UserModel user;
  UserSuccess({required this.user});
}

class UserFailure extends UserState {
  String error;
  UserFailure({required this.error});
}

final class UpdateUserSuccess extends UserState {}
