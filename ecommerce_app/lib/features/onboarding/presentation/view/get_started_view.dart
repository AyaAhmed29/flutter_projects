import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_router.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(Assets.imagesGetStarted, fit: BoxFit.cover),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.black.withValues(alpha: 0.6),
                    AppColors.black.withValues(alpha: 0.7),
                    AppColors.black.withValues(alpha: 0.8),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(38.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Text(
                      'You want Authentic, here you go!',
                      style: AppStyle.semiBold134,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24.h),

                    Text(
                      'Find it here, buy it now!',
                      style: AppStyle.regular14,
                    ),
                    SizedBox(height: 24.h),

                    CustomButton(
                      ontap: () {
                        GoRouter.of(context).push(AppRouter.loginView);
                      },
                      text: 'Login',
                    ),
                    SizedBox(height: 15.h),
                    CustomButton(
                      ontap: () {
                        GoRouter.of(context).push(AppRouter.registerView);
                      },
                      text: 'Register',
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
