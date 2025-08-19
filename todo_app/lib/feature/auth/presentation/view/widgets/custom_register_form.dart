import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:todo_app/feature/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:todo_app/feature/auth/presentation/cubit/sign_up_cubit/sign_up_state.dart';
=======
import 'package:todo_app/feature/auth/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:todo_app/feature/auth/presentation/cubit/register_cubit/register_state.dart';
>>>>>>> a9103be (Improve auth code)
=======
import 'package:todo_app/feature/auth/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:todo_app/feature/auth/presentation/cubit/register_cubit/register_state.dart';
=======
import 'package:todo_app/feature/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:todo_app/feature/auth/presentation/cubit/sign_up_cubit/sign_up_state.dart';
>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
import 'package:todo_app/feature/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:todo_app/generated/l10n.dart';

class CustomRegisterForm extends StatelessWidget {
<<<<<<< HEAD
<<<<<<< HEAD
  CustomRegisterForm({super.key});

  // bool isPasswordVisible = true;
  final formKey = GlobalKey<FormState>();

  // String password = '', email = '';
=======
  const CustomRegisterForm({super.key});

>>>>>>> a9103be (Improve auth code)
=======
  const CustomRegisterForm({super.key});

=======
  CustomRegisterForm({super.key});

  // bool isPasswordVisible = true;
  final formKey = GlobalKey<FormState>();

  // String password = '', email = '';
>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
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
<<<<<<< HEAD
=======
=======
>>>>>>> 3e00782 (update auth views)
                controller: RegisterCubit.get(context).emailController,
                text: S.of(context).Email,
                icon: Assets.assetsImagesIconsEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
<<<<<<< HEAD
>>>>>>> a9103be (Improve auth code)
=======
=======
>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
                controller: RegisterCubit.get(context).usernameController,
                text: S.of(context).Username,
                icon: Assets.assetsImagesIconsProfile,
                keyboardType: TextInputType.name,
<<<<<<< HEAD
<<<<<<< HEAD
                // onSaved: (p0) => email = '$p0@example.com',
=======
>>>>>>> a9103be (Improve auth code)
=======
=======
                // onSaved: (p0) => email = '$p0@example.com',
>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
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
<<<<<<< HEAD
                        // isPasswordVisible: isPasswordVisible,
                        text: S.of(context).Password,
                        // onSaved: (pass) {
                        //   password = pass ?? '';
                        // },
=======
                        text: S.of(context).Password,
>>>>>>> a9103be (Improve auth code)
=======
                        text: S.of(context).Password,
=======
                        // isPasswordVisible: isPasswordVisible,
                        text: S.of(context).Password,
                        // onSaved: (pass) {
                        //   password = pass ?? '';
                        // },
>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
                        icon: Assets.assetsImagesIconsPassword,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIconOnPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
<<<<<<< HEAD
<<<<<<< HEAD
                          // setState(() {
                          //   isPasswordVisible = !isPasswordVisible;
                          // });
=======
>>>>>>> a9103be (Improve auth code)
=======
=======
                          // setState(() {
                          //   isPasswordVisible = !isPasswordVisible;
                          // });
>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
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
=======
>>>>>>> 3e00782 (update auth views)
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
<<<<<<< HEAD
>>>>>>> a9103be (Improve auth code)
=======
=======

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
>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
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
