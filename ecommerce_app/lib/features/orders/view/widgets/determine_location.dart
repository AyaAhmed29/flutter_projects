import 'package:ecommerce_app/core/helper/app_validator.dart';
import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_router.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/core/widget/custom_svg.dart';
import 'package:ecommerce_app/features/location/view/location_view.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DetermineLocation extends StatelessWidget {
  const DetermineLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 100.h,
          width: 220.w,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withValues(alpha: 0.4),
                blurRadius: 6,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: AppPadding.all16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).address, style: AppStyle.medium12),
                TextFormField(
                  controller: TextEditingController(text: selectedLocationName),
                  validator: (value) {
                    return AppValidator.usernameValidator(value);
                  },
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: S.of(context).typeAddress,
                    hintStyle: AppStyle.regular12,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 100.h,
          width: 90.w,
          decoration: BoxDecoration(
            color: AppColors.pink,
            borderRadius: BorderRadius.circular(20),
          ),
          child: CustomSvg(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.locationView);
            },
            icon: Assets.imagesIconsLocationSVG,
            height: 50.h,
            width: 50.w,
          ),
        ),
      ],
    );
  }
}
