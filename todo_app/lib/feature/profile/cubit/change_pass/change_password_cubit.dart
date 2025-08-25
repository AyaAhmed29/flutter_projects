import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/profile/data/profile_repo.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmNewpasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ProfileRepo profileRepo = ProfileRepo();
  bool oldPasswordSecure = true;
  bool newPasswordSecure = true;
  bool confirmPasswordSecure = true;
  void changePassword() async {
    if (!formKey.currentState!.validate()) return;
    emit(ChangePasswordLoading());
    var response = await profileRepo.changePassword(
      oldPassword: oldPasswordController.text,
      newPassword: newPasswordController.text,
    );
    response.fold(
      (failure) => emit(ChangePasswordFailure(failure)),
      (success) => emit(ChangePasswordSuccess()),
    );
  }

  void oldPasswordControllerVisibility() {
    oldPasswordSecure = !oldPasswordSecure;
    emit(OldPasswordState());
  }

  void newPasswordControllerVisibility() {
    confirmPasswordSecure = !confirmPasswordSecure;
    emit(NewPasswordPassworState());
  }

  void confirmNewPasswordControllerVisibility() {
    confirmPasswordSecure = !confirmPasswordSecure;
    emit(ConfirmNewPassworState());
  }
}
