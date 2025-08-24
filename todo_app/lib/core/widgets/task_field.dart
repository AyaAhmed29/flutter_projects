import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/feature/home/view/widgets/number_container.dart';

class TaskField extends StatelessWidget {
  const TaskField({
    super.key,
    required this.text,
    required this.prefixIcon,

   required  this.onPressed,
    required this.color,
    required this.number,
  });
  final String text;
  final String prefixIcon;

  final Color color;
  final void Function() onPressed;
  final int number;
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        height: 63.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Container(
                height: 25.h,
                width: 25.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: color.withValues(alpha: 0.15),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    prefixIcon,
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  ),
                ),
              ),
            ),

            Text(text, style: AppStyle.regular16),
            Spacer(flex: 1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: NumberContainer(color: color, number: number),
            ),
          ],
        ),
      ),
    )
    ;
  }
}
