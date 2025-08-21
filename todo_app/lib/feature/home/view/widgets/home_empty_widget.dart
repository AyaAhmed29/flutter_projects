import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_style.dart';

class HomeEmptyWidget extends StatelessWidget {
  const HomeEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h),
        Text(
          'There are no tasks yet,\nPress the button\nTo add New Task ',
          style: AppStyle.light12.copyWith(fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 39.h),
        Image.asset(Assets.assetsImagesOBJECTS),
      ],
    );
  }
}
