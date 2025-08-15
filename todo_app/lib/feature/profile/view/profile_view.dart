import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/widgets/custom_userInf_App_bar.dart';
import 'package:todo_app/feature/profile/view/widgets/custom_field.dart';
import 'package:todo_app/generated/l10n.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomUserInfAppBar(),
          SizedBox(height: 20.h),
          CustomField(
            text: S.of(context).Profile,
            prefixIcon: Assets.assetsImagesIconsProfile,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.updateProfileView);
            },
          ),
          CustomField(
            text: S.of(context).ChangePassword,
            prefixIcon: Assets.assetsImagesIconsLock,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.changePasswordView);
            },
          ),
          CustomField(
            text: S.of(context).Settings,
            prefixIcon: Assets.assetsImagesIconsSetting,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.settingView);
            },
          ),
        ],
      ),
    );
  }
}
