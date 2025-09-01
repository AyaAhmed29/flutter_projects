import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_assets.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, this.image});
  final ImageProvider? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18.h),
      height: 298.h,
      width: 375.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image ?? AssetImage(Assets.assetsImagesProfile),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
