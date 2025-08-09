import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/home/view/widgets/custom_dropdown_field.dart';
import 'package:todo_app/feature/profile/view/profile_view.dart';
import 'package:todo_app/feature/task/view/widgets/custom_task_field.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EditTaskAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(Assets.assetsImagesProfile),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('In Progress', style: AppStyle.light12),
                      Text(
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        'Believe you can, and you\'re halfway there.',
                        style: AppStyle.light12.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomField(
            text: 'rfeHomergr',
            prefixIcon: Assets.assetsImagesIconsHome,
            suffixIcon: SvgPicture.asset(Assets.assetsImagesIconsDownArro),
          ),
          DisplayfieldTask(widget: Text('Grocery Shopping App')),
          DisplayfieldTask(
            widget: Text(
              'Go for grocery to buy some products. Go for grocery to buy some products. Go for grocery to buy some products. Go for grocery to buy some products.',
            ),
          ),
          DisplayfieldTask(
            widget: Row(
              children: [
                SvgPicture.asset(Assets.assetsImagesIconsCalendar),
                SizedBox(width: 10),
                Text(DateFormat('d MMMM, yyyy  h:mm a').format(DateTime.now())),
              ],
            ),
          ),

          SizedBox(height: 18),
          CustomButton(text: 'Mark as Done', onPressed: () {}),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 8,
              shadowColor: AppColors.primaryColor.withValues(alpha: .6),
              side: BorderSide(color: AppColors.primaryColor, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(14),
              ),
              fixedSize: Size(331, 50),
              backgroundColor: Colors.white,
            ),
            onPressed: () {},
            child: Text(
              'Update',
              style: AppStyle.light19.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

class DisplayfieldTask extends StatelessWidget {
  const DisplayfieldTask({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      constraints: BoxConstraints(minHeight: 50),
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16),
        child: widget,
      ),
    );
  }
}

class EditTaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EditTaskAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Edit Task',
        style: AppStyle.light19.copyWith(color: Colors.black),
      ),
      leading: IconButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: Icon(Icons.arrow_back),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),

            onPressed: () {},
            child: Row(
              children: [
                SvgPicture.asset(Assets.assetsImagesIconsDelete),
                SizedBox(width: 5),
                Text(
                  'Delete',
                  style: AppStyle.extraLight14.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
