import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/helper/app_validator.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/auth/cubit/login_cubit/login_cubit.dart';
import 'package:todo_app/feature/auth/cubit/login_cubit/login_state.dart';
import 'package:todo_app/feature/auth/view/widgets/custom_text_field.dart';
import 'package:todo_app/generated/l10n.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: LoginCubit.get(context).formKey,
      child: Column(
        children: [
          CustomTextField(
            validator: (value) =>
                AppValidator.emailValidator(context: context, value: value),
            text: S.of(context).Email,
            icon: Assets.assetsImagesIconsEmail,
            keyboardType: TextInputType.emailAddress,
            controller: LoginCubit.get(context).emailController,
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomTextField(
                validator: (value) => AppValidator.passwordValidator(value),
                obscureText: LoginCubit.get(context).passwordSecure,
                text: S.of(context).Password,
                icon: Assets.assetsImagesIconsPassword,
                keyboardType: TextInputType.visiblePassword,
                suffixIconOnPressed: LoginCubit.get(
                  context,
                ).changePasswordVisibility,
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
              LoginCubit.get(context).onLoginPressed();
            },
          ),
        ],
      ),
    );
  }
}
