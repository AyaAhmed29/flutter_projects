import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/auth/data/repos/auth_repo.dart';
import 'package:todo_app/feature/auth/presentation/cubit/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(Registeritial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  final AuthRepo authRepo;
  Future<void> register(String email, String pass) async {
    emit(RegisterLoading());

    try {
      final result = await authRepo.register(email, pass);
      result.fold(
        (failure) => emit(RegisterFailure(failure)),
        (user) => emit(RegisterSuccess(user)),
      );
    } catch (e) {
      emit(RegisterFailure(e.toString()));
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
