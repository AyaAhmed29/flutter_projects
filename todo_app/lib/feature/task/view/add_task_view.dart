import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/widgets/custom_app_bar.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/home/view/widgets/custom_dropdown_field.dart';
import 'package:todo_app/feature/task/view/widgets/custom_datetime_picker.dart';
import 'package:todo_app/feature/task/view/widgets/custom_task_field.dart';
import 'package:todo_app/generated/l10n.dart';

class AddTaskViwe extends StatefulWidget {
  const AddTaskViwe({super.key});

  @override
  State<AddTaskViwe> createState() => _AddTaskViweState();
}

class _AddTaskViweState extends State<AddTaskViwe> {
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titile: S.of(context).AddTask),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(Assets.assetsImagesProfile),
                ),
              ),
              CustomTaskField(text: S.of(context).Title),
              CustomTaskField(text: S.of(context).Description),
              CustomDropdownField(),
              CustomDateTimePicker(),
              SizedBox(height: 18.h),
              CustomButton(
                text: S.of(context).AddTask,
                onPressed: () {
                  if (key.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
