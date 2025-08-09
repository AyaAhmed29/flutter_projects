import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/feature/auth/view/widgets/custom_register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(Assets.assetsImagesProfile),
            ),
            SizedBox(height: 20),
            CustomRegisterForm(),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already Have An Account?', style: AppStyle.extraLight14),
                SizedBox(width: 40),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.loginView);
                  },
                  child: Text(
                    'Login',
                    style: AppStyle.extraLight14.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
