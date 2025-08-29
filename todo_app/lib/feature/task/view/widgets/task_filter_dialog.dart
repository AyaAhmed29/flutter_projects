import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/task/cubit/task_cubit.dart';
import 'package:todo_app/feature/task/view/widgets/custom_elevated_button.dart';
import 'package:todo_app/generated/l10n.dart';

Future<dynamic> filterDialog(BuildContext context) {
  final taskCubit = TaskCubit.get(context);

  return showDialog(
    context: context,
    barrierColor: Colors.black.withAlpha(100),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 15.h,
            ),
            content: SizedBox(
              width: 329.w,
              height: 381.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 15.w,
                    children: [
                      for (int i = 0; i < 4; i++)
                        CustomElevatedButton(
                          text: [
                            S.of(context).All,
                            S.of(context).Work,
                            S.of(context).Home,
                            S.of(context).Personal,
                          ][i],
                          isSelected: taskCubit.selectedTopIndex == i,
                          onTap: () {
                            setState(() {
                              taskCubit.selectedTopIndex = i;
                            });
                          },
                        ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Wrap(
                    spacing: 15.w,
                    children: [
                      for (int i = 0; i < 4; i++)
                        CustomElevatedButton(
                          text: [
                            S.of(context).All,
                            S.of(context).InProgress,
                            S.of(context).Missed,
                            S.of(context).Done,
                          ][i],
                          isSelected: taskCubit.selectedBottomIndex == i,
                          onTap: () {
                            setState(() {
                              taskCubit.selectedBottomIndex = i;
                            });
                          },
                        ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  CustomButton(
                    text: S.of(context).Filter,
                    onPressed: () {
                      taskCubit.filterTasks();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
