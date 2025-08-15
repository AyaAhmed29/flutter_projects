
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';

class InProgressCard extends StatelessWidget {
  const InProgressCard({
    super.key,
    required this.color,
    required this.taskType,
    required this.description,
    required this.icon,
  });
  final Color color;
  final String taskType;
  final String description;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 100.h,
      width: 250.w,
      decoration: BoxDecoration(
        color: color,

        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  taskType,
                  style: TextStyle(
                    color: color == AppColors.black
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
                SvgPicture.asset(icon),
              ],
            ),
            Text(
              description,
              softWrap: true,
              overflow: TextOverflow.visible,
              style: AppStyle.light12.copyWith(
                color: color == AppColors.black ? AppColors.white : AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
