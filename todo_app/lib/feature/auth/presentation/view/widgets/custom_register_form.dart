import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:todo_app/feature/auth/presentation/cubit/sign_up_cubit/sign_up_state.dart';
import 'package:todo_app/feature/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:todo_app/generated/l10n.dart';

class CustomRegisterForm extends StatelessWidget {
  CustomRegisterForm({super.key});

  // bool isPasswordVisible = true;
  final formKey = GlobalKey<FormState>();

  // String password = '', email = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              CustomTextField(
                controller: RegisterCubit.get(context).usernameController,
                text: S.of(context).Username,
                icon: Assets.assetsImagesIconsProfile,
                keyboardType: TextInputType.name,
                // onSaved: (p0) => email = '$p0@example.com',
              ),
              BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      CustomTextField(
                        obscureText: RegisterCubit.get(context).passwordSecure,

                        controller: RegisterCubit.get(
                          context,
                        ).passwordController,
                        // isPasswordVisible: isPasswordVisible,
                        text: S.of(context).Password,
                        // onSaved: (pass) {
                        //   password = pass ?? '';
                        // },
                        icon: Assets.assetsImagesIconsPassword,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIconOnPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                          // setState(() {
                          //   isPasswordVisible = !isPasswordVisible;
                          // });
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
                          if (RegisterCubit.get(
                                context,
                              ).confirmPasswordController.text !=
                              RegisterCubit.get(
                                context,
                              ).passwordController.text) {
                            return S.of(context).PasswordsDoNotMatch;
                          }
                          return null;
                        },

                        // isPasswordVisible: isConfirmPasswordVisible,
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

                          // setState(() {
                          //   isConfirmPasswordVisible = !isConfirmPasswordVisible;
                          // });
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
                onPressed: () {
                  formKey.currentState!.save();
                  var userName =
                      "${RegisterCubit.get(context).usernameController.text}@example.com";

                  if (formKey.currentState!.validate()) {
                    context.read<RegisterCubit>().register(
                      userName,
                      RegisterCubit.get(context).passwordController.text,
                    );
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
