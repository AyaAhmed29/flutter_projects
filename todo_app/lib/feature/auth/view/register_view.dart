import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo_app/core/helper/app_pop_up.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/widgets/image_picker/image_picker.dart';
import 'package:todo_app/feature/auth/cubit/register_cubit/register_cubit.dart';
import 'package:todo_app/feature/auth/cubit/register_cubit/register_state.dart';
import 'package:todo_app/feature/auth/view/widgets/auth_prompt.dart';
import 'package:todo_app/feature/auth/view/widgets/custom_image.dart';
import 'package:todo_app/feature/auth/view/widgets/custom_register_form.dart';
import 'package:todo_app/generated/l10n.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(
        builder: (context) {
          return BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
              if (state is RegisterSuccess) {
                AppPopUp.showSnackBar(
                  context: context,
                  text: S.of(context).RegistrationSuccessful,
                );

                AppRouter.router.go(AppRouter.homeView, extra: state.user);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is RegisterLoading ? true : false,
                child: Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        
                        // CustomImage(),
                        ImagePicker(
                          defaultBuilder: CustomImage(),
                          imageBuilder: (image) {
                            return CustomImage(
                              image: FileImage(File(image.path)),
                            );
                          },
                          onImagePicked: (image) {
                            RegisterCubit.get(context).userImage = image;
                          },
                        ),
                        CustomRegisterForm(),
                        AuthPrompt(
                          text: S.of(context).AlreadyHaveAnAccount,
                          textButton: S.of(context).Login,
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.loginView);
                          },
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
