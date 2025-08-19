import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
<<<<<<< HEAD
import 'package:todo_app/feature/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:todo_app/feature/auth/presentation/cubit/sign_up_cubit/sign_up_state.dart';
=======
import 'package:todo_app/feature/auth/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:todo_app/feature/auth/presentation/cubit/register_cubit/register_state.dart';
>>>>>>> a9103be (Improve auth code)
import 'package:todo_app/feature/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:todo_app/generated/l10n.dart';

class CustomRegisterForm extends StatelessWidget {
<<<<<<< HEAD
  CustomRegisterForm({super.key});

  // bool isPasswordVisible = true;
  final formKey = GlobalKey<FormState>();

  // String password = '', email = '';
=======
  const CustomRegisterForm({super.key});

>>>>>>> a9103be (Improve auth code)
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              CustomTextField(
<<<<<<< HEAD
=======
                controller: RegisterCubit.get(context).emailController,
                text: S.of(context).Email,
                icon: Assets.assetsImagesIconsEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
>>>>>>> a9103be (Improve auth code)
                controller: RegisterCubit.get(context).usernameController,
                text: S.of(context).Username,
                icon: Assets.assetsImagesIconsProfile,
                keyboardType: TextInputType.name,
<<<<<<< HEAD
                // onSaved: (p0) => email = '$p0@example.com',
=======
>>>>>>> a9103be (Improve auth code)
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
<<<<<<< HEAD
                        // isPasswordVisible: isPasswordVisible,
                        text: S.of(context).Password,
                        // onSaved: (pass) {
                        //   password = pass ?? '';
                        // },
=======
                        text: S.of(context).Password,
>>>>>>> a9103be (Improve auth code)
                        icon: Assets.assetsImagesIconsPassword,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIconOnPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
<<<<<<< HEAD
                          // setState(() {
                          //   isPasswordVisible = !isPasswordVisible;
                          // });
=======
>>>>>>> a9103be (Improve auth code)
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
<<<<<<< HEAD

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
=======
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
                onPressed: () {
                  formKey.currentState!.save();
                  ;

                  if (formKey.currentState!.validate()) {
                    RegisterCubit.get(context).register(
                      RegisterCubit.get(context).emailController.text,
>>>>>>> a9103be (Improve auth code)
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
