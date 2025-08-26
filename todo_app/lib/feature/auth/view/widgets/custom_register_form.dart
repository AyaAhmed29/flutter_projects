import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/helper/app_validator.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/auth/cubit/register_cubit/register_cubit.dart';
import 'package:todo_app/feature/auth/cubit/register_cubit/register_state.dart';
import 'package:todo_app/feature/auth/view/widgets/custom_text_field.dart';
import 'package:todo_app/generated/l10n.dart';

class CustomRegisterForm extends StatelessWidget {
  const CustomRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: RegisterCubit.get(context).formKey,
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              CustomTextField(
                validator: (value) {
                  return AppValidator.emailValidator(
                    context: context,
                    value: value,
                  );
                },
                controller: RegisterCubit.get(context).emailController,
                text: S.of(context).Email,
                icon: Assets.assetsImagesIconsEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                validator: (value) {
                  return AppValidator.usernameValidator(value);
                },
                controller: RegisterCubit.get(context).usernameController,
                text: S.of(context).Username,
                icon: Assets.assetsImagesIconsProfile,
                keyboardType: TextInputType.name,
              ),
              BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      CustomTextField(
                        validator: (value) {
                          return AppValidator.passwordValidator(value);
                        },
                        obscureText: RegisterCubit.get(context).passwordSecure,
                        controller: RegisterCubit.get(
                          context,
                        ).passwordController,
                        text: S.of(context).Password,
                        icon: Assets.assetsImagesIconsPassword,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIconOnPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        },
                        suffixIcon: RegisterCubit.get(context).passwordSecure
                            ? Assets.assetsImagesIconsUnlock
                            : Assets.assetsImagesIconsLock,
                      ),
                      CustomTextField(
                        controller: RegisterCubit.get(
                          context,
                        ).confirmPasswordController,
                        validator: (value) {
                          return AppValidator.confirmPasswordValidator(
                            password: RegisterCubit.get(
                              context,
                            ).passwordController.text,
                            value: value,
                          );
                        },
                        text: S.of(context).ConfirmPassword,
                        icon: Assets.assetsImagesIconsPassword,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: RegisterCubit.get(
                          context,
                        ).confirmPasswordSecure,
                        suffixIconOnPressed: () {
                          RegisterCubit.get(
                            context,
                          ).changeConfirmPasswordVisibility();
                        },
                        suffixIcon:
                            RegisterCubit.get(context).confirmPasswordSecure
                            ? Assets.assetsImagesIconsUnlock
                            : Assets.assetsImagesIconsLock,
                      ),
                    ],
                  );
                },
              ),
              CustomButton(
                text: S.of(context).Register,
                onPressed: () async {
                  RegisterCubit.get(context).onRegisterPressed();
                  GoRouter.of(context).pop();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
