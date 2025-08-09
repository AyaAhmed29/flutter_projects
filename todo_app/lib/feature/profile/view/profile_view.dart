import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/core/widgets/custom_userInf_App_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomUserInfAppBar(),
          SizedBox(height: 20),
          CustomField(
            text: 'Profile',
            prefixIcon: Assets.assetsImagesIconsProfile,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.updateProfileView);
            },
          ),
          CustomField(
            text: 'Change Password',
            prefixIcon: Assets.assetsImagesIconsLock,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.changePasswordView);
            },
          ),
          CustomField(
            text: 'Settings',
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

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
  });
  final String text;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        margin: EdgeInsets.all(8),
        height: 60,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            if (prefixIcon != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SvgPicture.asset(prefixIcon!),
              ),
            Text(text, style: AppStyle.regular16),
            Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child:
                  suffixIcon ?? SvgPicture.asset(Assets.assetsImagesIconsArrow),
            ),
          ],
        ),
      ),
    );
  }
}
