import 'package:ecommerce_app/core/helper/app_pop_up.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_router.dart';
import 'package:ecommerce_app/core/widget/custom_appbar.dart';
import 'package:ecommerce_app/features/auth/cubit/register_cubit/register_cubit.dart';
import 'package:ecommerce_app/features/auth/cubit/register_cubit/register_state.dart';
import 'package:ecommerce_app/features/auth/view/widgets/auth_header.dart';
import 'package:ecommerce_app/features/auth/view/widgets/custom_register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            AppPopUp.errorShowSnackBar(context: context, text: 'Success');
            GoRouter.of(context).go(AppRouter.navigationView);
          } else if (state is RegisterFailure) {
            AppPopUp.errorShowSnackBar(
              context: context,
              text: state.errorMessage,
            );
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
                  AuthHeader(text: 'Create an\naccount!'),
                  SizedBox(height: 33.h),
                  CustomRegisterForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
