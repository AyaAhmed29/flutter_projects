import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/auth/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:todo_app/feature/auth/presentation/view/widgets/custom_text_field.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({super.key});

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  bool isPasswordVisible = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final formKey = GlobalKey<FormState>();
  String email = '', pass = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            text: 'Username',
            icon: Assets.assetsImagesIconsProfile,
            keyboardType: TextInputType.name,
            onSaved: (p0) => email = "$p0@example.com",
          ),
          CustomTextField(
            isPasswordVisible: isPasswordVisible,
            text: 'Password',
            onSaved: (p0) => pass = p0!,

            icon: Assets.assetsImagesIconsPassword,
            keyboardType: TextInputType.visiblePassword,
            suffixIconOnPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            suffixIcon: isPasswordVisible
                ? Assets.assetsImagesIconsUnlock
                : Assets.assetsImagesIconsLock,
          ),

          CustomButton(
            text: 'Login',
            onPressed: () {
              formKey.currentState!.save();
              if (formKey.currentState!.validate()) {
                context.read<SignInCubit>().login(
                  email,
                  pass,
                );
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
