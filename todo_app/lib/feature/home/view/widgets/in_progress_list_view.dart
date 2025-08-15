import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/feature/home/view/widgets/in_progress_card.dart';
import 'package:todo_app/generated/l10n.dart';

class InProgressListView extends StatelessWidget {
  InProgressListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List item = [
      [
        AppColors.black,
        S.of(context).WorkTask,
        S.of(context).AddNewFeatures,

        Assets.assetsImagesIconsWorkGreen,
      ],
      [
        AppColors.primaryColor.withValues(alpha: .15),
        S.of(context).PersonalTask,
        S.of(context).ImproveEnglishSkills,
        Assets.assetsImagesIconsPersonal,
      ],
      [
        AppColors.pink.withValues(alpha: .15),
        S.of(context).PersonalTask,
        S.of(context).AddNewFeatures,
        Assets.assetsImagesIconsWork,
      ],
    ];
    return SizedBox(
      height: 110.h,
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
