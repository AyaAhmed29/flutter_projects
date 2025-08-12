import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/core/widgets/custom_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 90.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0.w),
              child: Image.asset(
                Assets.assetsImagesLitsGo,
                fit: BoxFit.cover,
                height: 342.h,
                width: 301.w,
              ),
            ),
            SizedBox(height: 60.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.w),
              child: Text(
                'Welcome To \nDo It !',
                textAlign: TextAlign.center,
                style: AppStyle.regular25,
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                'Ready to conquer your tasks? Let\'s Do \nIt together.',
                textAlign: TextAlign.center,
                style: AppStyle.medium16,
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            ),
            SizedBox(height: 35.h),
            CustomButton(
              text: 'Let’s Start',
              onPressed: () {
                GoRouter.of(context).go(AppRouter.registerView);
              },
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
