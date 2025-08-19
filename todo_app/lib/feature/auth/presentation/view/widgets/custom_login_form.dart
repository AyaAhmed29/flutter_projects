import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:todo_app/feature/auth/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:todo_app/feature/auth/presentation/cubit/sign_in_cubit/sign_in_state.dart';
=======
import 'package:todo_app/feature/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:todo_app/feature/auth/presentation/cubit/login_cubit/login_state.dart';
>>>>>>> a9103be (Improve auth code)
=======
import 'package:todo_app/feature/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:todo_app/feature/auth/presentation/cubit/login_cubit/login_state.dart';
=======
import 'package:todo_app/feature/auth/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:todo_app/feature/auth/presentation/cubit/sign_in_cubit/sign_in_state.dart';
>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
import 'package:todo_app/feature/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:todo_app/generated/l10n.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

<<<<<<< HEAD
<<<<<<< HEAD
  // bool isPasswordVisible = true;
  // AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

=======
>>>>>>> a9103be (Improve auth code)
=======
=======
  // bool isPasswordVisible = true;
  // AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
<<<<<<< HEAD
<<<<<<< HEAD
            text: S.of(context).Username,
            icon: Assets.assetsImagesIconsProfile,
            keyboardType: TextInputType.name,
            controller: LoginCubit.get(context).usernameController,
=======
=======
>>>>>>> 3e00782 (update auth views)
            text: S.of(context).Email,
            icon: Assets.assetsImagesIconsEmail,
            keyboardType: TextInputType.emailAddress,
            controller: LoginCubit.get(context).emailController,
<<<<<<< HEAD
>>>>>>> a9103be (Improve auth code)
=======
=======
            text: S.of(context).Username,
            icon: Assets.assetsImagesIconsProfile,
            keyboardType: TextInputType.name,
            controller: LoginCubit.get(context).usernameController,
>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomTextField(
                obscureText: LoginCubit.get(context).passwordSecure,
<<<<<<< HEAD
<<<<<<< HEAD
                //  isPasswordVisible: isPasswordVisible,
                text: S.of(context).Password,

=======
                text: S.of(context).Password,
>>>>>>> a9103be (Improve auth code)
=======
                text: S.of(context).Password,
=======
                //  isPasswordVisible: isPasswordVisible,
                text: S.of(context).Password,

>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
                icon: Assets.assetsImagesIconsPassword,
                keyboardType: TextInputType.visiblePassword,
                suffixIconOnPressed: LoginCubit.get(
                  context,
                ).changePasswordVisibility,
<<<<<<< HEAD
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
=======
                suffixIcon: LoginCubit.get(context).passwordSecure
=======
                // () {
                //   // setState(() {
                //   //   isPasswordVisible = !isPasswordVisible;
                //   // });
                // },
                suffixIcon: LoginCubit.get(context).passwordSecure
                    //  isPasswordVisible
>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
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
=======
>>>>>>> 3e00782 (update auth views)
                LoginCubit.get(context).login(
                  LoginCubit.get(context).emailController.text,
                  LoginCubit.get(context).passwordController.text,
                );
<<<<<<< HEAD
>>>>>>> a9103be (Improve auth code)
=======
=======
                var userName =
                    "${LoginCubit.get(context).usernameController.text}@example.com";

                context.read<LoginCubit>().login(
                  userName ,
                  LoginCubit.get(context).passwordController.text,
                );

                // } else {
                //   autovalidateMode = AutovalidateMode.always;
                //   // setState(() {});
>>>>>>> 0c81967c441e7c738a2ffecdedb8bf36fa374dd7
>>>>>>> 3e00782 (update auth views)
              }
            },
          ),
        ],
      ),
    );
  }
}
