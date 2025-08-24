import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/auth/data/repos/auth_repo.dart';
import 'package:todo_app/feature/auth/data/model/user_model.dart';
import 'package:todo_app/feature/auth/cubit/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(Registeritial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  final AuthRepo authRepo;
  Future<UserModel> register({required String email, required String pass}) async {
    emit(RegisterLoading());

    try {
      final result = await authRepo.register(email, pass, usernameController.text);

      final user = result.fold(
        (failure) {
          emit(RegisterFailure(failure)); 
          throw failure; 
        },
        (user) {
          emit(
            RegisterSuccess(
              UserModel(
                uid: user.uid,
                email: user.email,
                userName: user.userName,
              ),
            ),
          );
          return user; 
        }, 
      );
      return user;
    } catch (e) {
      emit(RegisterFailure(e.toString()));
      rethrow;
    }
   
  }

  bool passwordSecure = true;
  bool confirmPasswordSecure = true;

  void changePasswordVisibility() {
    passwordSecure = !passwordSecure;
    emit(ChangePasswordState());
  }

  void changeConfirmPasswordVisibility() {
    confirmPasswordSecure = !confirmPasswordSecure;
    emit(ChangeConfirmPassworState());
  }
}
