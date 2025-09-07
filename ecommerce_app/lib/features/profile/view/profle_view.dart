import 'package:ecommerce_app/core/helper/app_pop_up.dart';
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_router.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/core/widget/custom_appbar.dart';
import 'package:ecommerce_app/features/profile/cubit/user/user_cubit.dart';
import 'package:ecommerce_app/features/profile/cubit/user/user_state.dart';
import 'package:ecommerce_app/features/profile/view/widgets/profile_item.dart';
import 'package:ecommerce_app/features/profile/view/widgets/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfleView extends StatelessWidget {
  const ProfleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getUser(),
      child: Scaffold(
        appBar: CustomAppBar(title: 'Profile'),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserFailure) {
              return AppPopUp.errorShowSnackBar(
                context: context,
                text: state.error,
              );
            } else if (state is UserSuccess) {
              return Padding(
                padding: AppPadding.horizontal24,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UserImage(imageUrl: state.user.imagePath),

                    SizedBox(height: 20.h),
                    Text(
                      '${state.user.name}',
                      style: AppStyle.semiBold18.copyWith(
                        color: AppColors.pink,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    ProfileItem(
                      title: 'My Profile',
                      icon: '',
                      onPressed: () {
                        GoRouter.of(
                          context,
                        ).push(AppRouter.myProfileView, extra: state.user);
                      },
                    ),
                    ProfileItem(title: 'My Orders', icon: '', onPressed: () {}),
                    ProfileItem(
                      title: 'My Favorites',
                      icon: '',
                      onPressed: () {},
                    ),
                    ProfileItem(title: 'Settings', icon: '', onPressed: () {}),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Divider(thickness: 1.h, color: AppColors.pink),
                    ),
                    ProfileItem(title: 'Log Out', icon: '', onPressed: () {}),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
