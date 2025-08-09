import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/feature/auth/view/widgets/custom_login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
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
            CustomLoginForm(),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don’t Have An Account?', style: AppStyle.extraLight14),
                SizedBox(width: 40),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  child: Text(
                    'Register',
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
