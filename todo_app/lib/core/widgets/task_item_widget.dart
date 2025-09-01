import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';

class TaskItemWidget extends StatelessWidget {
  final String title;
  final String status;

  final String? image;

  const TaskItemWidget({
    super.key,
    required this.title,

    required this.status,

    this.image,
  });

  Color getStatusColor() {
    switch (status) {
      case 'Done' || 'تمت':
        return AppColors.primaryColor;
      case 'Missed' || 'فاتت':
        return Colors.red;
      case 'In Progress' || "قيد التنفيذ":
        return AppColors.primaryColor.withValues(alpha: .2);
      default:
        return AppColors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 8.0.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: image != null
                  ? Image.network(
                      image!,
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      Assets.assetsImagesProfile,
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      title,
                      style: AppStyle.light14,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: getStatusColor(),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(status, style: AppStyle.light12),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          status == 'Work'
                              ? Assets.assetsImagesIconsWork
                              : status == 'Home'
                              ? Assets.assetsImagesIconsHome
                              : status == 'Personal'
                              ? Assets.assetsImagesIconsPersonal
                              : Assets.assetsImagesIconsWork,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
