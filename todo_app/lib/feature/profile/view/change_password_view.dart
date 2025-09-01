import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/feature/auth/data/model/user_model.dart';
import 'package:todo_app/feature/profile/view/widgets/custom_confirm_pass_form.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = GoRouterState.of(context);
    final user = state.extra as UserModel?;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
              child: (user?.image != null && user!.image!.isNotEmpty)
                  ? Image.network(user.image!, fit: BoxFit.cover)
                  : Image.asset(Assets.assetsImagesProfile, fit: BoxFit.cover),
            ),
            CustomConfirmPassForm(),
          ],
        ),
      ),
    );
  }
}
