import 'package:ecommerce_app/core/helper/app_pop_up.dart';
import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_router.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/core/utlis/storage/prodect_model/app_local_storage.dart';
import 'package:ecommerce_app/core/widget/custom_appbar.dart';
import 'package:ecommerce_app/features/auth/view/widgets/custom_dialog.dart';
import 'package:ecommerce_app/features/profile/cubit/user/user_cubit.dart';
import 'package:ecommerce_app/features/profile/cubit/user/user_state.dart';
import 'package:ecommerce_app/features/profile/view/widgets/profile_item.dart';
import 'package:ecommerce_app/features/profile/view/widgets/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

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
              return ProfileShimmer();
            } else if (state is UserFailure) {
              return AppPopUp.errorShowSnackBar(
                context: context,
                text: state.error,
              );
            } else if (state is UserSuccess) {
              // return ProfileShimmer();
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
                      icon: Assets.imagesIconsProfile,
                      onPressed: () {
                        GoRouter.of(
                          context,
                        ).push(AppRouter.myProfileView, extra: state.user);
                      },
                    ),
                    ProfileItem(
                      title: 'My Orders',
                      icon: Assets.imagesIconsBagProfile,
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.ordersView);
                      },
                    ),
                    ProfileItem(
                      title: 'My Favorites',
                      icon: Assets.imagesIconsHeart,
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.myFavoritesView);
                      },
                    ),
                    ProfileItem(
                      title: 'Settings',
                      icon: Assets.imagesIconsSetting,
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Divider(thickness: 1.h, color: AppColors.pink),
                    ),
                    ProfileItem(
                      title: 'Log Out',
                      icon: Assets.imagesIconsLogout,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => CustomDialog(
                            onConfirm: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.remove('access_token');
                              await prefs.remove('refresh_token');
                              await LocalStorage().clearCart();
                              AppPopUp.showSnackBar(
                                context: context,
                                text: 'LOg out successfully',
                              );
                              GoRouter.of(context).go(AppRouter.loginView);
                            },
                            title: 'Confirmation',
                            content:
                                'Are you sure you want to log out from your account?',
                          ),
                        );
                      },
                    ),
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

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal24,
      child: Column(
        children: [
          SizedBox(height: 60.h),
          ShimmerBox(width: 100.w, height: 100.h, shape: BoxShape.circle),
          SizedBox(height: 30.h),
          ShimmerBox(width: 150.w, height: 20.h, borderRadius: 8),
          SizedBox(height: 50.h),
          Column(
            children: List.generate(5, (index) => const ProfileShimmerItem()),
          ),
        ],
      ),
    );
  }
}

class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final BoxShape shape;

  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 0,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey.withValues(alpha: .4),
      highlightColor: AppColors.grey.withValues(alpha: .1),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: shape == BoxShape.rectangle
                ? BorderRadius.circular(borderRadius)
                : null,
            shape: shape,
          ),
        ),
      ),
    );
  }
}

class ProfileShimmerItem extends StatelessWidget {
  const ProfileShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ShimmerBox(width: 20.w, height: 20.h, shape: BoxShape.circle),
          SizedBox(width: 16.w),
          Expanded(
            child: ShimmerBox(
              width: double.infinity,
              height: 20.h,
              borderRadius: 8,
            ),
          ),
          SizedBox(width: 16.w),
          ShimmerBox(width: 20.w, height: 20.h, borderRadius: 4),
        ],
      ),
    );
  }
}
