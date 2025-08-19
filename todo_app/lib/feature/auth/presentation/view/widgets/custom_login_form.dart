import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
<<<<<<< HEAD
import 'package:todo_app/feature/auth/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:todo_app/feature/auth/presentation/cubit/sign_in_cubit/sign_in_state.dart';
=======
import 'package:todo_app/feature/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:todo_app/feature/auth/presentation/cubit/login_cubit/login_state.dart';
>>>>>>> a9103be (Improve auth code)
import 'package:todo_app/feature/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:todo_app/generated/l10n.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

<<<<<<< HEAD
  // bool isPasswordVisible = true;
  // AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

=======
>>>>>>> a9103be (Improve auth code)
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
<<<<<<< HEAD
            text: S.of(context).Username,
            icon: Assets.assetsImagesIconsProfile,
            keyboardType: TextInputType.name,
            controller: LoginCubit.get(context).usernameController,
=======
            text: S.of(context).Email,
            icon: Assets.assetsImagesIconsEmail,
            keyboardType: TextInputType.emailAddress,
            controller: LoginCubit.get(context).emailController,
>>>>>>> a9103be (Improve auth code)
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomTextField(
                obscureText: LoginCubit.get(context).passwordSecure,
<<<<<<< HEAD
                //  isPasswordVisible: isPasswordVisible,
                text: S.of(context).Password,

=======
                text: S.of(context).Password,
>>>>>>> a9103be (Improve auth code)
                icon: Assets.assetsImagesIconsPassword,
                keyboardType: TextInputType.visiblePassword,
                suffixIconOnPressed: LoginCubit.get(
                  context,
                ).changePasswordVisibility,
<<<<<<< HEAD
                // () {
                //   // setState(() {
                //   //   isPasswordVisible = !isPasswordVisible;
                //   // });
                // },
                suffixIcon: LoginCubit.get(context).passwordSecure
                    //  isPasswordVisible
=======
                suffixIcon: LoginCubit.get(context).passwordSecure
>>>>>>> a9103be (Improve auth code)
                    ? Assets.assetsImagesIconsUnlock
                    : Assets.assetsImagesIconsLock,
                controller: LoginCubit.get(context).passwordController,
              );
            },
          ),
          CustomButton(
            text: S.of(context).Login,
            onPressed: () {
              formKey.currentState!.save();
              if (formKey.currentState!.validate()) {
<<<<<<< HEAD
                var userName =
                    "${LoginCubit.get(context).usernameController.text}@example.com";

                context.read<LoginCubit>().login(
                  userName ,
                  LoginCubit.get(context).passwordController.text,
                );

                // } else {
                //   autovalidateMode = AutovalidateMode.always;
                //   // setState(() {});
=======
                LoginCubit.get(context).login(
                  LoginCubit.get(context).emailController.text,
                  LoginCubit.get(context).passwordController.text,
                );
>>>>>>> a9103be (Improve auth code)
              }
            },
          ),
        ],
      ),
    );
  }
}
