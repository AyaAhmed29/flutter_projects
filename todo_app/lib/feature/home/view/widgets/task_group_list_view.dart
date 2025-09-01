import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/widgets/task_field.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';
import 'package:todo_app/core/widgets/task_item_widget.dart';
import 'package:todo_app/generated/l10n.dart';

class TaskGroupListView extends StatelessWidget {
  final List<TaskModel> tasks;

  const TaskGroupListView({super.key, required this.tasks});

  get homeCount => tasks.where((task) => task.group == "Home");
  get workCount => tasks.where((task) => task.group == "Work");
  get personalCount => tasks.where((task) => task.group == "Personal");

  @override
  Widget build(BuildContext context) {
    final List item = [
      [
        S.of(context).PersonalTask,
        AppColors.primaryColor,
        Assets.assetsImagesIconsProfileWithoutBackground,
        personalCount.length,
        "Personal",
      ],
      [
        S.of(context).HomeTask,
        AppColors.pink,
        Assets.assetsImagesIconsHomeWithoutBackground,
        homeCount.length,
        "Home",
      ],
      [
        S.of(context).WorkTask,
        AppColors.black,
        Assets.assetsImagesIconsWorkWithoutBackground,
        workCount.length,
        "Work",
      ],
    ];

    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: item.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskField(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskGroupView(
                    groupName: item[index][0],
                    tasks: tasks
                        .where((task) => task.group == item[index][4])
                        .toList(),
                  ),
                ),
              );
            },
            text: item[index][0],
            color: item[index][1],
            prefixIcon: item[index][2],
            number: item[index][3],
          );
        },
      ),
    );
  }
}

class TaskGroupView extends StatelessWidget {
  final String groupName;
  final List<TaskModel> tasks;

  const TaskGroupView({
    super.key,
    required this.groupName,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(groupName)),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return TaskItemWidget(
            title: task.title,
            status: task.status,
            group: task.group,
            image: task.imageUrl,
          );
        },
      ),
    );
  }
}
