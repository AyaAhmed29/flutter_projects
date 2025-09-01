import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';
import 'package:todo_app/generated/l10n.dart';

class TaskCompletionCard extends StatelessWidget {
  const TaskCompletionCard({super.key, required this.tasks});
  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    int done = tasks.where((t) => t.status == 'Done').length;
    int total = tasks.length;
    int percentage = total == 0 ? 0 : ((done / total) * 100).round();

    return Container(
      margin: EdgeInsets.all(2),
      height: 135.h,
      width: 350.w,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.of(context).TasksAlmostDone, style: AppStyle.regular14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('$percentage', style: AppStyle.medium40),
                    Text('%', style: AppStyle.medium24),
                  ],
                ),

                TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.todayTasksView);
                  },
                  child: Container(
                    height: 36.h,
                    width: 121.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        S.of(context).ViewTasks,
                        style: AppStyle.regular16.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
