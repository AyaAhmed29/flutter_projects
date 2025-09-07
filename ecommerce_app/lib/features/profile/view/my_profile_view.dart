import 'dart:io';
import 'package:ecommerce_app/core/helper/app_pop_up.dart';
import 'package:ecommerce_app/core/helper/app_validator.dart';
import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/widget/custom_button.dart';
import 'package:ecommerce_app/features/auth/data/model/user_model.dart';
import 'package:ecommerce_app/features/auth/view/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/auth/view/widgets/image_picker/image_picker.dart';
import 'package:ecommerce_app/features/profile/cubit/user/user_cubit.dart';
import 'package:ecommerce_app/features/profile/cubit/user/user_state.dart';
import 'package:ecommerce_app/features/profile/view/widgets/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as UserModel?;

    return BlocProvider(
      create: (context) => UserCubit()..controlUser(extra),
      child: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UpdateUserSuccess) {
            AppPopUp.showSnackBar(
              context: context,
              text: 'Data updated successfully',
            );
          } else if (state is UserFailure) {
            AppPopUp.showSnackBar(context: context, text: state.error);
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('My Profile')),
          body: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              final cubit = UserCubit.get(context);
              return Padding(
                padding: AppPadding.horizontal24,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ImagePicker(
                          defaultBuilder: UserImage(imageUrl: extra?.imagePath),
                          imageBuilder: (image) {
                            return UserImage(
                              image: FileImage(File(image.path)),
                            );
                          },
                          onImagePicked: (image) {
                            cubit.image = image;
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: AppColors.lightGrey,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: AppColors.lightGrey,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColors.blueberry,
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60.h),
                    Form(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: cubit.usernameController,
                            text: 'Full Name',
                            icon: Assets.imagesIconsUser,
                            keyboardType: TextInputType.name,
                            validator: (value) =>
                                AppValidator.usernameValidator(value),
                          ),
                          SizedBox(height: 10.h),
                          CustomTextField(
                            controller: cubit.pohoneController,
                            text: 'Phone',
                            icon: Assets.imagesIconsPhone,
                            keyboardType: TextInputType.phone,
                            validator: (value) =>
                                AppValidator.phoneValidator(value),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h),
                    CustomButton(
                      text: 'Save',
                      ontap: () {
                        cubit.onPreasedSave();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
