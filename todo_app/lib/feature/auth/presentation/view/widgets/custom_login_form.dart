import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/auth/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:todo_app/feature/auth/presentation/cubit/sign_in_cubit/sign_in_state.dart';
import 'package:todo_app/feature/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:todo_app/generated/l10n.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  // bool isPasswordVisible = true;
  // AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            text: S.of(context).Username,
            icon: Assets.assetsImagesIconsProfile,
            keyboardType: TextInputType.name,
            controller: LoginCubit.get(context).usernameController,
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomTextField(
                obscureText: LoginCubit.get(context).passwordSecure,
                //  isPasswordVisible: isPasswordVisible,
                text: S.of(context).Password,

                icon: Assets.assetsImagesIconsPassword,
                keyboardType: TextInputType.visiblePassword,
                suffixIconOnPressed: LoginCubit.get(
                  context,
                ).changePasswordVisibility,
                // () {
                //   // setState(() {
                //   //   isPasswordVisible = !isPasswordVisible;
                //   // });
                // },
                suffixIcon: LoginCubit.get(context).passwordSecure
                    //  isPasswordVisible
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
                var userName =
                    "${LoginCubit.get(context).usernameController.text}@example.com";

                context.read<LoginCubit>().login(
                  userName ,
                  LoginCubit.get(context).passwordController.text,
                );

                // } else {
                //   autovalidateMode = AutovalidateMode.always;
                //   // setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
