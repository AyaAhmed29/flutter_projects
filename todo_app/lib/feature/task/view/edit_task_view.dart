import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/profile/view/widgets/custom_field.dart';
import 'package:todo_app/feature/task/view/widgets/display_field_task.dart';
import 'package:todo_app/feature/task/view/widgets/edit_task_app_bar.dart';
import 'package:todo_app/generated/l10n.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EditTaskAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 100.h,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CircleAvatar(
                    radius: 40.r,
                    backgroundImage: AssetImage(Assets.assetsImagesProfile),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).InProgress, style: AppStyle.light12),
                      Text(
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        S.of(context).BelieveYouCan,
                        style: AppStyle.light12.copyWith(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomField(
            text: S.of(context).Home,
            prefixIcon: Assets.assetsImagesIconsHome,
            suffixIcon: SvgPicture.asset(Assets.assetsImagesIconsDownArro),
          ),
          DisplayfieldTask(widget: Text(S.of(context).GroceryShoppingApp)),
          DisplayfieldTask(widget: Text(S.of(context).GroceryDescription)),
          DisplayfieldTask(
            widget: Row(
              children: [
                SvgPicture.asset(Assets.assetsImagesIconsCalendar),
                SizedBox(width: 10.w),
                Text(DateFormat('d MMMM, yyyy  h:mm a').format(DateTime.now())),
              ],
            ),
          ),

          SizedBox(height: 18.h),
          CustomButton(text: S.of(context).MarkAsDone, onPressed: () {}),
          SizedBox(height: 20.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 8,
              shadowColor: AppColors.primaryColor.withValues(alpha: .6),
              side: BorderSide(color: AppColors.primaryColor, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(14),
              ),
              fixedSize: Size(331.w, 50.h),
              backgroundColor: Colors.white,
            ),
            onPressed: () {},
            child: Text(
              S.of(context).Update,
              style: AppStyle.light19.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
