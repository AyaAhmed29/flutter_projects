import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/feature/home/view/widgets/in_progress_card.dart';

class InProgressListView extends StatelessWidget {
  InProgressListView({super.key});
  final List item = [
    [
      AppColors.black,
      'Work Task',
      'Add New Features',
      Assets.assetsImagesIconsWorkGreen,
    ],
    [
      AppColors.primaryColor.withValues(alpha: .15),
      'Personal Task',
      'Improve my English skills by trying to speek',
      Assets.assetsImagesIconsPersonal,
    ],
    [
      AppColors.pink.withValues(alpha: .15),
      'Personal Task',
      'Add New Features',
      Assets.assetsImagesIconsWork,
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: item.length,
        itemBuilder: (BuildContext context, int index) {
          return InProgressCard(
            color: item[index][0],
            taskType: item[index][1],
            description: item[index][2],
            icon: item[index][3],
          );
        },
      ),
    );
  }
}
