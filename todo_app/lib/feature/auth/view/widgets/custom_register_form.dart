
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/auth/view/widgets/custom_text_field.dart';

class CustomRegisterForm extends StatefulWidget {
  const CustomRegisterForm({super.key});

  @override
  State<CustomRegisterForm> createState() => _CustomRegisterFormState();
}

class _CustomRegisterFormState extends State<CustomRegisterForm> {
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  final formKey = GlobalKey<FormState>();
  String password = '';

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
          ),
          CustomTextField(
            isPasswordVisible: isPasswordVisible,
            text: 'Password',
            onSaved: (pass) {
              password = pass ?? '';
            },
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
          CustomTextField(
            validator: (value) {
              if (value != password) {
                return 'Passwords do not match';
              }
              return null;
            },

            isPasswordVisible: isConfirmPasswordVisible,
            text: 'Confirm Password',
            icon: Assets.assetsImagesIconsPassword,
            keyboardType: TextInputType.visiblePassword,
            suffixIconOnPressed: () {
              setState(() {
                isConfirmPasswordVisible = !isConfirmPasswordVisible;
              });
            },
            suffixIcon: isPasswordVisible
                ? Assets.assetsImagesIconsUnlock
                : Assets.assetsImagesIconsLock,
          ),
          SizedBox(height: 20),
          CustomButton(
            text: 'Register',
            onPressed: () {
              formKey.currentState!.save();
              if (formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Registration successful')),
                );

                AppRouter.router.go(AppRouter.homeView);
              }
            },
          ),
        ],
      ),
    );
  }
}
