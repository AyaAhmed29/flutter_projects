import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/feature/auth/view/widgets/auth_prompt.dart';
import 'package:todo_app/feature/auth/view/widgets/custom_image.dart';
import 'package:todo_app/feature/auth/view/widgets/custom_register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomImage(),
            CustomRegisterForm(),
            AuthPrompt(
              text: 'Already Have An Account?',
              textButton: 'Login',
              onPressed: () {
                GoRouter.of(context).push(AppRouter.loginView);
              },
            ),
          ],
        ),
      ),
    );
  }
}