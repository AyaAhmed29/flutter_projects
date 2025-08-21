import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/feature/home/view/widgets/in_progress_card.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';

class InProgressListView extends StatelessWidget {
  final List<TaskModel> tasks;

  const InProgressListView({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
   
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          final task = tasks[index];
          return InProgressCard(
            color: task.group == 'Work'
                ? AppColors.black
                : task.group == 'Personal'
                ? AppColors.primaryColor.withValues(alpha: 0.15)
                : AppColors.pink.withValues(alpha: 0.15),
            taskType:"${task.group} Task",
            description: task.description,
            icon: task.group == 'Work'
                ? Assets.assetsImagesIconsWorkGreen
                : task.group == 'Personal'
                ? Assets.assetsImagesIconsPersonal
                : Assets.assetsImagesIconsHome,
          );
        },
      ),
    );
  }
}
