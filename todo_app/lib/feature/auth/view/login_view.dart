import 'package:flutter/material.dart';
import 'package:todo_app/feature/auth/view/widgets/auth_prompt.dart';
import 'package:todo_app/feature/auth/view/widgets/custom_image.dart';
import 'package:todo_app/feature/auth/view/widgets/custom_login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomImage(),
            CustomLoginForm(),
            AuthPrompt(text: 'Don’t Have An Account?', textButton: 'Register'),
          ],
        ),
      ),
    );
  }
}
