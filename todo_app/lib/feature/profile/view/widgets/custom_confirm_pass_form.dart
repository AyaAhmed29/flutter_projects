import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/profile/view/widgets/custom_confirm_pass_field.dart';

class CustomConfirmPassForm extends StatefulWidget {
  const CustomConfirmPassForm({super.key});

  @override
  State<CustomConfirmPassForm> createState() => _CustomConfirmPassFormState();
}

class _CustomConfirmPassFormState extends State<CustomConfirmPassForm> {
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
          CustomConfirmPassField(
            isPasswordVisible: isPasswordVisible,
            text: 'Old Password',

            suffixIconOnPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            suffixIcon: isPasswordVisible
                ? Assets.assetsImagesIconsUnlock
                : Assets.assetsImagesIconsLock,
          ),
          CustomConfirmPassField(
            isPasswordVisible: isPasswordVisible,
            text: 'New Password',
            onSaved: (pass) {
              password = pass ?? '';
            },
            suffixIconOnPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            suffixIcon: isPasswordVisible
                ? Assets.assetsImagesIconsUnlock
                : Assets.assetsImagesIconsLock,
          ),
          CustomConfirmPassField(
            validator: (value) {
              if (value != password) {
                return 'Passwords do not match';
              }
              return null;
            },

            isPasswordVisible: isConfirmPasswordVisible,
            text: 'Confirm Password',
            suffixIconOnPressed: () {
              setState(() {
                isConfirmPasswordVisible = !isConfirmPasswordVisible;
              });
            },
            suffixIcon: isPasswordVisible
                ? Assets.assetsImagesIconsUnlock
                : Assets.assetsImagesIconsLock,
          ),
          SizedBox(height: 20.h),
          CustomButton(
            text: 'Save',
            onPressed: () {
              formKey.currentState!.save();
              if (formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Registration successful')),
                );

                AppRouter.router.pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
