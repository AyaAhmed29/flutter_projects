import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/feature/profile/view/widgets/custom_confirm_pass_form.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
              child: Image.asset(Assets.assetsImagesProfile),
            ),
            CustomConfirmPassForm(),
          ],
        ),
      ),
    );
  }
}