import 'package:flutter/material.dart';
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
            Image.asset(Assets.assetsImagesLitsGo, fit: BoxFit.cover),
            SizedBox(height: 40),
            Text(
              'Welcome To \nDo It !',
              textAlign: TextAlign.center,
              style: AppStyle.regular25,
            ),
            SizedBox(height: 40),
            Text(
              'Ready to conquer your tasks? Let\'s Do \nIt together.',
              textAlign: TextAlign.center,
              style: AppStyle.medium16,
            ),
            SizedBox(height: 40),
            CustomButton(
              text: 'Let’s Start',
              onPressed: () {
                GoRouter.of(context).go(AppRouter.registerView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
