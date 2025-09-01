import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helper/cloudinary_service.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/widgets/custom_app_bar.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/core/widgets/image_picker/image_picker.dart';
import 'package:todo_app/feature/task/cubit/task_cubit.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';
import 'package:todo_app/feature/task/view/widgets/custom_datetime_picker.dart';
import 'package:todo_app/feature/task/view/widgets/custom_dropdown_field.dart';
import 'package:todo_app/feature/task/view/widgets/custom_task_field.dart';
import 'package:todo_app/generated/l10n.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    return Scaffold(
      appBar: CustomAppBar(titile: S.of(context).AddTask),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: [
              ImagePicker(
                defaultBuilder: TaskImage(),
                imageBuilder: (image) {
                  return TaskImage(image: FileImage(File(image.path)));
                },
                onImagePicked: (image) {
                  TaskCubit.get(context).taskImage = image;
                },
              ),

              CustomTaskField(
                text: S.of(context).Title,
                controller: TaskCubit.get(context).titleController,
              ),
              CustomTaskField(
                text: S.of(context).Description,
                controller: TaskCubit.get(context).descriptionController,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                child: CustomDropdownField(
                  value: TaskCubit.get(context).selectedGroup,
                  onChanged: (value) {
                    TaskCubit.get(context).setGroup(value);
                  },
                ),
              ),

              CustomDateTimePicker(
                controller: TaskCubit.get(context).endTimeController,
              ),
              SizedBox(height: 18.h),

              CustomButton(
                text: S.of(context).AddTask,
                onPressed: () async {
                  if (key.currentState!.validate()) {
                    TaskCubit.get(context).addTask(
                      TaskModel(
                        imageUrl: TaskCubit.get(context).taskImage != null
                            ? await CloudinaryService.uploadImage(
                                File(TaskCubit.get(context).taskImage!.path),
                              )
                            : null,

                        title: TaskCubit.get(context).titleController.text,
                        description: TaskCubit.get(
                          context,
                        ).descriptionController.text,
                        group: TaskCubit.get(context).selectedGroup!,
                        endTime: TaskCubit.get(context).endTime!,
                        userId: FirebaseAuth.instance.currentUser!.uid,
                        status: getstatus(
                          endTime: TaskCubit.get(context).endTime!,
                          isDone: false,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskImage extends StatelessWidget {
  const TaskImage({super.key, this.image});
  final ImageProvider? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Image(image: image ?? AssetImage(Assets.assetsImagesProfile)),
      ),
    );
  }
}
