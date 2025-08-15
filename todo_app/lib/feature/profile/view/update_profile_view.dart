import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/generated/l10n.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
            child: Image.asset(Assets.assetsImagesProfile),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              enabled: false,

              decoration: InputDecoration(
                hintText: S.of(context).Username,
                hintStyle: AppStyle.extraLight14,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(color: AppColors.lightGray),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
