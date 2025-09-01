import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/feature/auth/data/model/user_model.dart';

class CustomUserInfAppBar extends StatelessWidget {
  const CustomUserInfAppBar({super.key, this.onTap, required this.userModel});
  final void Function()? onTap;
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: CircleAvatar(
                radius: 30.r,
                backgroundImage:
                    (userModel.image != null && userModel.image!.isNotEmpty)
                    ? NetworkImage(userModel.image!)
                    : AssetImage(Assets.assetsImagesProfile),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello!', style: AppStyle.light12),
                Text(
                  userModel.userName,
                  style: AppStyle.light12.copyWith(fontSize: 16.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
