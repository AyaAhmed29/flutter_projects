import 'package:flutter/material.dart';
import 'package:todo_app/core/service/show_snack_bar.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/feature/auth/presentation/view/widgets/auth_prompt.dart';
import 'package:todo_app/feature/auth/presentation/view/widgets/custom_image.dart';
import 'package:todo_app/feature/auth/presentation/view/widgets/custom_login_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo_app/core/service/firebase_auth_servise.dart';
import 'package:todo_app/feature/auth/data/repo/auth_repo_imp.dart';
import 'package:todo_app/feature/auth/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:todo_app/feature/auth/presentation/cubit/sign_in_cubit/sign_in_state.dart';
import 'package:todo_app/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AuthRepoImpl(FirebaseAuthService())),
      child: Builder(
        builder: (context) {
          return BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginFailure) {
                ShowSnackBar(context: context, text: state.errorMessage);
              }
              if (state is LoginSuccess) {
                ShowSnackBar(
                  context: context,
                  text: S.of(context).LoginSuccessfully,
                );

                AppRouter.router.go(AppRouter.homeView);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is LoginLoading,
                child: Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomImage(),
                        CustomLoginForm(),
                        AuthPrompt(
                          text: S.of(context).DontHaveAnAccount,
                          textButton: S.of(context).Register,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
