import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/profile/view/widgets/custom_confirm_pass_field.dart';
import 'package:todo_app/generated/l10n.dart';

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
            text: S.of(context).OldPassword,

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
            text: S.of(context).NewPassword,
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
                return S.of(context).PasswordsDoNotMatch;
              }
              return null;
            },

            isPasswordVisible: isConfirmPasswordVisible,
            text: S.of(context).ConfirmPassword,

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
            text: S.of(context).Save,
            onPressed: () {
              formKey.currentState!.save();
              if (formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).RegistrationSuccessful)),
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
