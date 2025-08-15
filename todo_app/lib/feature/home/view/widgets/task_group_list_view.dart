import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/widgets/task_field.dart';
import 'package:todo_app/generated/l10n.dart';

class TaskGroupListView extends StatelessWidget {
  TaskGroupListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List item = [
      [
        S.of(context).PersonalTask,

        AppColors.primaryColor,
        Assets.assetsImagesIconsProfileWithoutBackground,
        5,
      ],
      [
        S.of(context).HomeTask,

        AppColors.pink,
        Assets.assetsImagesIconsHomeWithoutBackground,
        5,
      ],
      [
        S.of(context).WorkTask,
        AppColors.black,
        Assets.assetsImagesIconsWorkWithoutBackground,
        1,
      ],
      [
        S.of(context).HomeTask,
        AppColors.pink,
        Assets.assetsImagesIconsHomeWithoutBackground,
        5,
      ],
      [
        S.of(context).WorkTask,
        AppColors.black,
        Assets.assetsImagesIconsWorkWithoutBackground,
        1,
      ],
    ];
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
