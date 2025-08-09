import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/widgets/custom_app_bar.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/feature/home/view/widgets/custom_dropdown_field.dart';
import 'package:todo_app/feature/task/view/widgets/custom_task_field.dart';

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
      appBar: CustomAppBar(titile: 'Add Task'),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(Assets.assetsImagesProfile),
                ),
              ),
              CustomTaskField(text: 'Title'),
              CustomTaskField(text: 'Description'),
              CustomDropdownField(),
              CustomTaskField(
                onTap: () async {
                  await   showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                },
                text: 'End Time',
                prefixIcon: Assets.assetsImagesIconsCalendar,
              ),
              SizedBox(height: 18),
              CustomButton(
                text: 'Add Task',
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
