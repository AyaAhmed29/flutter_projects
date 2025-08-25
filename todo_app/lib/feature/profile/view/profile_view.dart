import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/helper/app_pop_up.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/widgets/custom_userInf_app_bar.dart';
import 'package:todo_app/feature/auth/data/model/user_model.dart';
import 'package:todo_app/feature/profile/view/widgets/custom_field.dart';
import 'package:todo_app/generated/l10n.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {


    final extra = GoRouterState.of(context).extra;
    final user = extra != null ? extra as UserModel : null;
    return Scaffold(
      body: Column(
        children: [
          if (user != null) CustomUserInfAppBar(userModel: user),
          SizedBox(height: 20.h),
          CustomField(
            text: S.of(context).Profile,
            prefixIcon: Assets.assetsImagesIconsProfile,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.updateProfileView, extra: user);
            },
          ),
          CustomField(
            text: S.of(context).ChangePassword,
            prefixIcon: Assets.assetsImagesIconsLock,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.changePasswordView, extra: user);
            },
          ),
          CustomField(
            text: S.of(context).Settings,
            prefixIcon: Assets.assetsImagesIconsSetting,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.settingView);
            },
          ),
          CustomField(
            text: S.of(context).Logout,
            prefixIcon: Assets.assetsImagesIconsSetting,
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              AppPopUp.showSnackBar(
                context: context, // Changed from showSnackBar to AppPopUp.showSnackBar
                text: S.of(context).LogoutSuccessfully,
              );
              GoRouter.of(context).push(AppRouter.registerView);
            },
          ),
        ],
      ),
    );
  }
}
