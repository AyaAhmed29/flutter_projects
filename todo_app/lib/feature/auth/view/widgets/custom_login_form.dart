import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/auth/view/widgets/custom_text_field.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({super.key});

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  bool isPasswordVisible = true;
  final formKey = GlobalKey<FormState>();
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

          SizedBox(height: 20),
          CustomButton(
            text: 'Login',
            onPressed: () {
              formKey.currentState!.save();
              if (formKey.currentState!.validate()) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Login successful')));

                AppRouter.router.go(AppRouter.homeView);
              }
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
