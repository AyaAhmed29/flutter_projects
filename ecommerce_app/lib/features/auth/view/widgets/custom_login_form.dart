import 'package:ecommerce_app/core/helper/app_validator.dart';
import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/widget/custom_button.dart';
import 'package:ecommerce_app/features/auth/cubit/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/auth/cubit/login_cubit/login_state.dart';
import 'package:ecommerce_app/features/auth/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: LoginCubit.get(context).formKey,
      child: Column(
        children: [
          CustomTextField(
            validator: (value) =>
                AppValidator.emailValidator(context: context, value: value),
            text: 'Email',
            icon: Assets.imagesIconsEmail,
            keyboardType: TextInputType.emailAddress,
            controller: LoginCubit.get(context).emailController,
          ),
          SizedBox(height: 22.h),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomTextField(
                validator: (value) => AppValidator.passwordValidator(value),
                obscureText: LoginCubit.get(context).passwordSecure,
                text: 'Password',
                icon: Assets.imagesIconsLock,
                keyboardType: TextInputType.visiblePassword,
                suffixIconOnPressed: LoginCubit.get(
                  context,
                ).changePasswordVisibility,
                suffixIcon: LoginCubit.get(context).passwordSecure
                    ? Assets.imagesIconsCloseEye
                    : Assets.imagesIconsEye,
                controller: LoginCubit.get(context).passwordController,
              );
            },
          ),
          SizedBox(height: 55.h),
          CustomButton(
            text: 'Login',
            ontap: () {
              LoginCubit.get(context).onTalogin();
            },
          ),
        ],
      ),
    );
  }
}
