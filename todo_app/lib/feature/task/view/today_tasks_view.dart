import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/core/widgets/custom_app_bar.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/task/view/widgets/task_status_indicator.dart';

class TodayTasksView extends StatelessWidget {
  const TodayTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          filterDialog(context);
        },

        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        child: Image.asset(Assets.assetsImagesIconsFilter),
      ),
      appBar: CustomAppBar(titile: 'Tasks'),

      body: SingleChildScrollView(
        child: Column(
          children: [
            TaskSearch(),
            TaskStatusIndicator(text: 'Results', number: 4),
            TaskItemWidget(
              title: 'Go to supermarket to buy some milk & eggs',
              status: 'Done',
              icon: Assets.assetsImagesIconsHome,
            ),
            TaskItemWidget(
              title: 'Go to supermarket to buy some milk & eggs',
              status: 'In Progress',
              icon: Assets.assetsImagesIconsHome,
            ),
            TaskItemWidget(
              title: 'Go to supermarket to buy some milk & eggs',
              status: 'Missed',
              icon: Assets.assetsImagesIconsHome,
            ),
            TaskItemWidget(
              title: 'Go to supermarket to buy some milk & eggs',
              status: 'In Progress',
              icon: Assets.assetsImagesIconsHome,
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> filterDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: .5),
      builder: (context) => Center(
        child: Container(
          height: 400,
          width: 330,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  spacing: 5,
                  children: [
                    CustomElevatedButton(text: 'All'),
                    CustomElevatedButton(text: 'Work'),
                    CustomElevatedButton(text: 'Home'),
                    CustomElevatedButton(text: 'Personal'),
                  ],
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 5,
                  children: [
                    CustomElevatedButton(text: 'All'),
                    CustomElevatedButton(text: 'In Progress'),
                    CustomElevatedButton(text: 'Missed'),
                    CustomElevatedButton(text: 'Done'),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(Assets.assetsImagesIconsCalendar),
                        SizedBox(width: 10),
                        Text(
                          DateFormat(
                            'd MMMM, yyyy  h:mm a',
                          ).format(DateTime.now()),
                          style: AppStyle.light14,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(text: 'Filter', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 1, color: Colors.black),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),

      onPressed: () => Navigator.pop(context),
      child: Text(text, style: AppStyle.extraLight14),
    );
  }
}

class TaskItemWidget extends StatelessWidget {
  final String title;
  final String status;
  final String icon;

  const TaskItemWidget({
    super.key,
    required this.title,

    required this.status,
    required this.icon,
  });

  Color getStatusColor() {
    switch (status) {
      case 'Done':
        return AppColors.primaryColor;
      case 'Missed':
        return Colors.red;
      case 'In Progress':
        return AppColors.primaryColor.withValues(alpha: .2);
      default:
        return AppColors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                Assets.assetsImagesProfile,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(title, style: AppStyle.light14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: getStatusColor(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(status, style: AppStyle.light12),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(icon),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskSearch extends StatelessWidget {
  const TaskSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 50,

      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: AppStyle.extraLight14,
                border: InputBorder.none,
                suffixIcon: Transform.scale(
                  scale: .5,
                  child: SvgPicture.asset(Assets.assetsImagesIconsSearch),
                ),
              ),
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
