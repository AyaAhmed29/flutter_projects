import 'package:ecommerce_app/core/helper/app_validator.dart';
import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/widget/custom_button.dart';
import 'package:ecommerce_app/features/auth/cubit/register_cubit/register_cubit.dart';
import 'package:ecommerce_app/features/auth/cubit/register_cubit/register_state.dart';
import 'package:ecommerce_app/features/auth/view/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/auth/view/widgets/register_agreement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRegisterForm extends StatelessWidget {
  const CustomRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: RegisterCubit.get(context).formKey,
      child: Builder(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                validator: (value) {
                  return AppValidator.usernameValidator(value);
                },
                controller: RegisterCubit.get(context).usernameController,
                text: 'Full Name',
                icon: Assets.imagesIconsUser,
                keyboardType: TextInputType.name,
              ),
              _hight10(),
              CustomTextField(
                text: 'Phone',
                keyboardType: TextInputType.phone,
                icon: Assets.imagesIconsPhone,
                validator: (value) {
                  return AppValidator.phoneValidator(value);
                },
              ),
              _hight10(),
              CustomTextField(
                validator: (value) {
                  return AppValidator.emailValidator(
                    context: context,
                    value: value,
                  );
                },
                controller: RegisterCubit.get(context).emailController,
                text: 'Email',
                icon: Assets.imagesIconsEmail,
                keyboardType: TextInputType.emailAddress,
              ),

              BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      _hight10(),
                      CustomTextField(
                        validator: (value) {
                          return AppValidator.passwordValidator(value);
                        },
                        obscureText: RegisterCubit.get(context).passwordSecure,
                        controller: RegisterCubit.get(
                          context,
                        ).passwordController,
                        text: 'Password',
                        icon: Assets.imagesIconsLock,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIconOnPressed: () {
                          RegisterCubit.get(context).passwordVisibility();
                        },

                        suffixIcon: RegisterCubit.get(context).passwordSecure
                            ? Assets.imagesIconsCloseEye
                            : Assets.imagesIconsEye,
                      ),
                      _hight10(),
                      CustomTextField(
                        controller: RegisterCubit.get(
                          context,
                        ).confirmPasswordController,
                        validator: (value) {
                          return AppValidator.confirmPasswordValidator(
                            password: RegisterCubit.get(
                              context,
                            ).passwordController.text,
                            value: value,
                          );
                        },
                        text: 'ConfirmPassword',
                        icon: Assets.imagesIconsLock,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: RegisterCubit.get(
                          context,
                        ).confirmPasswordSecure,
                        suffixIconOnPressed: () {
                          RegisterCubit.get(
                            context,
                          ).confirmPasswordVisibility();
                        },

                        suffixIcon:
                            RegisterCubit.get(context).confirmPasswordSecure
                            ? Assets.imagesIconsCloseEye
                            : Assets.imagesIconsEye,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 21.h),
              RegisterAgreement(),
              SizedBox(height: 28.h),

              CustomButton(text: 'Create Account', ontap: () {}),
            ],
          );
        },
      ),
    );
  }

  SizedBox _hight10() => SizedBox(height: 10.h);
}
