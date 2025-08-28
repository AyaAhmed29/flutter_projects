import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/widgets/custom_elevated_button.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: 538.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.blue, AppColors.lightblue],
                ),

                image: DecorationImage(
                  image: AssetImage(Assets.assetsImagesModernBackground),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 450.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: AppPaddings.horizontal32,
                  child: Column(
                    children: [
                      SizedBox(height: 52.h),
                      Text(
                        'Get The Latest News And Updates',
                        style: AppStyle.semiBold32,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'From Politics to Entertainment: Your One-Stop Source for Comprehensive Coverage of the Latest News and Developments Across the Glob will be right on your hand.',
                        style: AppStyle.regular18,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24.h),
                      CustomElevatedButton(
                        text: 'Explore',
                        onPressed: () {
                          GoRouter.of(context).go(AppRouter.navigationViwe);
                        },
                        icon: Assets.assetsImagesIconsArrow,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
