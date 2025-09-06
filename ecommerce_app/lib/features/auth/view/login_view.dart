import 'package:ecommerce_app/core/helper/app_pop_up.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/widget/custom_appbar.dart';
import 'package:ecommerce_app/features/auth/cubit/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/auth/cubit/login_cubit/login_state.dart';
import 'package:ecommerce_app/features/auth/view/widgets/auth_header.dart';
import 'package:ecommerce_app/features/auth/view/widgets/custom_login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            AppPopUp.showSnackBar(context: context, text: 'sucess');
          } else if (state is LoginFailure) {
            AppPopUp.showSnackBar(context: context, text: state.errorMessage);
          }
        },
        child: Scaffold(
          appBar: CustomAppBar(title: ''),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPadding.horizontal29,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  AuthHeader(text: 'Welcome \nBack!'),
                  SizedBox(height: 45.h),
                  CustomLoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
