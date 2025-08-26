import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helper/app_pop_up.dart';
import 'package:todo_app/core/helper/app_validator.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/auth/view/widgets/custom_text_field.dart';
import 'package:todo_app/feature/profile/cubit/change_pass/change_password_cubit.dart';
import 'package:todo_app/generated/l10n.dart';

class CustomConfirmPassForm extends StatelessWidget {
  const CustomConfirmPassForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordFailure) {
            AppPopUp.errorShowSnackBar(
              context: context,
              text: state.errorMessage,
            );
          } else if (state is ChangePasswordSuccess) {
            AppPopUp.showSnackBar(
              context: context,
              text: 'Change Password Success',
            );
          }
        },
        builder: (context, state) {
          return state is ChangePasswordLoading
              ? const Center(child: CircularProgressIndicator())
              : Form(
                  key: ChangePasswordCubit.get(context).formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        text: S.of(context).OldPassword,
                        controller: ChangePasswordCubit.get(
                          context,
                        ).oldPasswordController,
                        validator: AppValidator.passwordValidator,
                        obscureText: ChangePasswordCubit.get(
                          context,
                        ).oldPasswordSecure,
                        suffixIconOnPressed: ChangePasswordCubit.get(
                          context,
                        ).oldPasswordControllerVisibility,

                        suffixIcon:
                            ChangePasswordCubit.get(context).oldPasswordSecure
                            ? Assets.assetsImagesIconsUnlock
                            : Assets.assetsImagesIconsLock,
                        keyboardType: TextInputType.visiblePassword,
                      ),

                      CustomTextField(
                        validator: AppValidator.passwordValidator,
                        text: S.of(context).NewPassword,
                        controller: ChangePasswordCubit.get(
                          context,
                        ).newPasswordController,
                        suffixIcon:
                            ChangePasswordCubit.get(context).newPasswordSecure
                            ? Assets.assetsImagesIconsUnlock
                            : Assets.assetsImagesIconsLock,
                        obscureText: ChangePasswordCubit.get(
                          context,
                        ).newPasswordSecure,
                        suffixIconOnPressed: ChangePasswordCubit.get(
                          context,
                        ).newPasswordControllerVisibility,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      CustomTextField(
                        validator: (value) {
                          return AppValidator.confirmPasswordValidator(
                            password: value!,
                            value: ChangePasswordCubit.get(
                              context,
                            ).newPasswordController.text,
                          );
                        },

                        obscureText: ChangePasswordCubit.get(
                          context,
                        ).confirmPasswordSecure,
                        suffixIconOnPressed: ChangePasswordCubit.get(
                          context,
                        ).confirmNewPasswordControllerVisibility,
                        controller: ChangePasswordCubit.get(
                          context,
                        ).confirmNewpasswordController,
                        text: S.of(context).ConfirmPassword,
                        suffixIcon:
                            ChangePasswordCubit.get(
                              context,
                            ).confirmPasswordSecure
                            ? Assets.assetsImagesIconsUnlock
                            : Assets.assetsImagesIconsLock,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SizedBox(height: 20.h),
                      CustomButton(
                        text: S.of(context).Save,
                        onPressed: () {
                          ChangePasswordCubit.get(context).changePassword();
                        },
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
