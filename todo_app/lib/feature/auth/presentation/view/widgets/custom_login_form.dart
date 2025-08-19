
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:todo_app/feature/auth/presentation/cubit/login_cubit/login_state.dart';
import 'package:todo_app/feature/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:todo_app/generated/l10n.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            text: S.of(context).Email,
            icon: Assets.assetsImagesIconsEmail,
            keyboardType: TextInputType.emailAddress,
            controller: LoginCubit.get(context).emailController,
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomTextField(
                obscureText: LoginCubit.get(context).passwordSecure,
                text: S.of(context).Password,
                icon: Assets.assetsImagesIconsPassword,
                keyboardType: TextInputType.visiblePassword,
                suffixIconOnPressed: LoginCubit.get(context).changePasswordVisibility,
                suffixIcon: LoginCubit.get(context).passwordSecure
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
                LoginCubit.get(context).login(
                  LoginCubit.get(context).emailController.text,
                  LoginCubit.get(context).passwordController.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
