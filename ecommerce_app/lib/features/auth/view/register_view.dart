import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/widget/custom_appbar.dart';
import 'package:ecommerce_app/features/auth/cubit/register_cubit/register_cubit.dart';
import 'package:ecommerce_app/features/auth/view/widgets/auth_header.dart';
import 'package:ecommerce_app/features/auth/view/widgets/custom_register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
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
    );
  }
}
