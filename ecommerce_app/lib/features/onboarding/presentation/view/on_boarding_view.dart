import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_router.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/features/onboarding/presentation/Widget/custom_page.dart';
import 'package:ecommerce_app/features/onboarding/presentation/Widget/custom_smooth_page_indicator.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: currentPage != 2,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).go(AppRouter.getStartedView);
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text('Skip', style: AppStyle.semiBold18),
                  ),
                ),
              ),
              SizedBox(height: 140.h),
              Expanded(
                child: PageView(
                  controller: controller,
                  children: [
                    CustomPage(
                      image: Assets.imagesPageViewItem1Image,
                      text: S.of(context).chooseProducts,
                      descText: S.of(context).loremDescription1,
                    ),
                    CustomPage(
                      image: Assets.imagesPageViewItem2Image,
                      text: S.of(context).fastDelivery,
                      descText: S.of(context).loremDescription2,
                    ),
                    CustomPage(
                      image: Assets.imagesPageViewItem3Image,
                      text: S.of(context).easyPayment,
                      descText: S.of(context).loremDescription3,
                    ),
                  ],
                ),
              ),
              CustomSmoothPageIndicator(
                currentPage: currentPage,
                controller: controller,
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
