import 'package:ecommerce_app/core/utlis/app_router.dart';
import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      GoRouter.of(context).go(AppRouter.onBoardingView);
      var sharedPref = await SharedPreferences.getInstance();
      var accessToken = sharedPref.getString('access_token');

      if (accessToken == null) {
        GoRouter.of(context).go(AppRouter.loginView);
      } else {
        GoRouter.of(context).go(AppRouter.onBoardingView);
      }
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesAppIcon),
            SizedBox(width: 9.w),
            Text('Stylish', style: AppStyle.bold40),
          ],
        ),
      ),
    );
  }
}
