import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/feature/home/view/widgets/in_progress_list_view.dart';
import 'package:todo_app/feature/home/view/widgets/number_container.dart';
import 'package:todo_app/feature/home/view/widgets/task_completion_card.dart';
import 'package:todo_app/feature/home/view/widgets/task_group_list_view.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';

class HomeTasks extends StatelessWidget {
  final List<TaskModel> tasks;
  const HomeTasks({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: TaskCompletionCard()),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text('In Progress', style: AppStyle.light14),
              SizedBox(width: 10.w),
              NumberContainer(
                number: tasks.length,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
        InProgressListView(tasks: tasks),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Text('Task Groups'),
        ),
        TaskGroupListView(tasks: tasks),
      ],
    );
  }
}
