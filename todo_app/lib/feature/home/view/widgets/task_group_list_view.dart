import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/widgets/task_field.dart';

class TaskGroupListView extends StatelessWidget {
  TaskGroupListView({super.key});

  final List item = [
    [
      'Personal Task',
      AppColors.primaryColor,
      Assets.assetsImagesIconsProfileWithoutBackground,
      5,
    ],
    [
      'Home Task',
      AppColors.pink,
      Assets.assetsImagesIconsHomeWithoutBackground,
      5,
    ],
    [
      'Work Task',
      AppColors.black,
      Assets.assetsImagesIconsWorkWithoutBackground,
      1,
    ],
    [
      'Home Task',
      AppColors.pink,
      Assets.assetsImagesIconsHomeWithoutBackground,
      5,
    ],
    [
      'Work Task',
      AppColors.black,
      Assets.assetsImagesIconsWorkWithoutBackground,
      1,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: item.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskField(
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
