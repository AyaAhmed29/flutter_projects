import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/feature/task/cubit/task_cubit.dart';
import 'package:todo_app/generated/l10n.dart';

class TaskSearch extends StatelessWidget {
  const TaskSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      height: 50.h,

      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              onChanged: (value) {
                TaskCubit.get(context).updateSearch(value);
              },
           
              decoration: InputDecoration(
                hintText: S.of(context).Search,
                hintStyle: AppStyle.extraLight14,
                border: InputBorder.none,
                suffixIcon: Transform.scale(
                  scale: .5,
                  child: SvgPicture.asset(Assets.assetsImagesIconsSearch),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
