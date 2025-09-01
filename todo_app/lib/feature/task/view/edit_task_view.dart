import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo_app/core/helper/app_pop_up.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/core/widgets/custom_dialog.dart';
import 'package:todo_app/feature/task/cubit/task_cubit.dart';
import 'package:todo_app/feature/task/cubit/task_state.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';
import 'package:todo_app/feature/task/view/widgets/custom_dropdown_field.dart';
import 'package:todo_app/feature/task/view/widgets/custom_task_field.dart';
import 'package:todo_app/feature/task/view/widgets/display_field_task.dart';
import 'package:todo_app/feature/task/view/widgets/edit_task_app_bar.dart';
import 'package:todo_app/generated/l10n.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: task.title);
    final descriptionController = TextEditingController(text: task.description);
    DateTime selectedDate = task.endTime;

    return BlocProvider(
      create: (context) => TaskCubit(),
      child: Builder(
        builder: (context) {
          return BlocConsumer<TaskCubit, TaskState>(
            listener: (context, state) {
              if (state is UpdateTaskSuccess) {
                AppPopUp.showSnackBar(
                  context: context,
                  text: state.successMessage,
                );
                Navigator.pop(context);
              } else if (state is TaskFailure) {
                AppPopUp.showSnackBar(
                  context: context,
                  text: state.errorMessage,
                );
              }
            },
            builder: (context, state) {
              return Scaffold(
                appBar: EditTaskAppBarWidget(task: task),
                body: ModalProgressHUD(
                  inAsyncCall: state is LoadingTask,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TaskHeaderWidget(
                          Image:
                              (task.imageUrl != null &&
                                  task.imageUrl!.isNotEmpty)
                              ? NetworkImage(task.imageUrl!)
                              : AssetImage(Assets.assetsImagesProfile)
                                    as ImageProvider,
                        ),
                        TaskGroupDropdown(task: task),
                        TaskTitleField(controller: titleController),
                        SizedBox(height: 16),
                        TaskDescriptionField(controller: descriptionController),
                        SizedBox(height: 16),
                        TaskDatePickerField(selectedDate: selectedDate),
                        SizedBox(height: 18.h),
                        MarkAsDoneButton(task: task),
                        UpdateTaskButton(
                          task: task,
                          titleController: titleController,
                          descriptionController: descriptionController,
                        ),
                        SizedBox(height: 18.h),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// AppBar Widget
class EditTaskAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final TaskModel task;
  const EditTaskAppBarWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return EditTaskAppBar(
      onPressed: () {
        final cubit = TaskCubit.get(context);
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            content: S.of(context).AreYouSureYouWantToDeleteThisTask,
            onConfirm: () {
              cubit.deleteTask(task.taskId!);
              Navigator.of(context).pop();
              AppPopUp.showSnackBar(
                context: context,
                text: S.of(context).TaskDeletedSuccessfully,
              );
            },
            title: S.of(context).ConfirmDeletion,
          ),

          // AlertDialog(
          //   title: Text(S.of(context).ConfirmDeletion),
          //   content: Text(S.of(context).AreYouSureYouWantToDeleteThisTask),
          //   actions: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         TextButton(
          //           onPressed: () => Navigator.of(context).pop(),
          //           child: Text(
          //             S.of(context).no,
          //             style: TextStyle(color: Colors.grey),
          //           ),
          //         ),
          //         TextButton(
          //           onPressed: () {
          //             cubit.deleteTask(task.taskId!);
          //             Navigator.of(context).pop();
          //             Navigator.of(context).pop();
          //             AppPopUp.showSnackBar(
          //               context: context,
          //               text: S.of(context).TaskDeletedSuccessfully,
          //             );
          //           },
          //           child: Text(
          //             S.of(context).yes,
          //             style: TextStyle(color: Colors.red),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

/// Header Widget
class TaskHeaderWidget extends StatelessWidget {
  const TaskHeaderWidget({super.key, required this.Image});
  final ImageProvider Image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(radius: 40.r, backgroundImage: Image),
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
    );
  }
}

/// Group Dropdown
class TaskGroupDropdown extends StatelessWidget {
  final TaskModel task;
  const TaskGroupDropdown({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return CustomDropdownField(
      color: AppColors.white,
      hasBorder: false,
      value: TaskCubit.get(context).selectedGroup ?? task.group,
      onChanged: (String? newValue) {
        TaskCubit.get(context).setGroup(newValue!);
      },
    );
  }
}

/// Title Field
class TaskTitleField extends StatelessWidget {
  final TextEditingController controller;
  const TaskTitleField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomEditTask(text: S.of(context).Title, controller: controller);
  }
}

/// Description Field
class TaskDescriptionField extends StatelessWidget {
  final TextEditingController controller;
  const TaskDescriptionField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomEditTask(
      text: S.of(context).Description,
      controller: controller,
    );
  }
}

/// Date Picker Field
class TaskDatePickerField extends StatelessWidget {
  final DateTime selectedDate;
  const TaskDatePickerField({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    DateTime tempDate = selectedDate;
    return GestureDetector(
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: tempDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(tempDate),
          );
          if (pickedTime != null) {
            tempDate = DateTime(
              picked.year,
              picked.month,
              picked.day,
              pickedTime.hour,
              pickedTime.minute,
            );
          }
        }
      },
      child: DisplayfieldTask(
        widget: Row(
          children: [
            SvgPicture.asset(Assets.assetsImagesIconsCalendar),
            SizedBox(width: 10.w),
            Text(DateFormat('d MMMM, yyyy   h:mm a').format(tempDate)),
          ],
        ),
      ),
    );
  }
}

/// Mark as Done Button
class MarkAsDoneButton extends StatelessWidget {
  final TaskModel task;
  const MarkAsDoneButton({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: S.of(context).MarkAsDone,
      onPressed: () {
        if (task.status == 'Done') {
          AppPopUp.errorShowSnackBar(
            context: context,
            text: S.of(context).ThisTaskIsAlreadyMarkedAsDone,
          );
          return;
        }
        if (task.status == 'Missed') {
          AppPopUp.errorShowSnackBar(
            context: context,
            text: S.of(context).taskismissing,
          );
          return;
        }

        final updatedTask = TaskModel(
          status: 'Done',
          taskId: task.taskId,
          title: task.title,
          description: task.description,
          endTime: task.endTime,
          userId: task.userId,
          group: TaskCubit.get(context).selectedGroup ?? task.group,
        );

        TaskCubit.get(context).updateTask(updatedTask);
        AppPopUp.showSnackBar(
          context: context,
          text: S.of(context).TaskAlreadyDone,
        );
      },
    );
  }
}

/// Update Task Button
class UpdateTaskButton extends StatelessWidget {
  final TaskModel task;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  const UpdateTaskButton({
    super.key,
    required this.task,
    required this.titleController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: AppColors.white,
      text: S.of(context).Update,
      onPressed: () {
        final cubit = TaskCubit.get(context);

        if (titleController.text == task.title &&
            descriptionController.text == task.description &&
            task.endTime == task.endTime &&
            (cubit.selectedGroup ?? task.group) == task.group) {
          AppPopUp.showSnackBar(
            context: context,
            text: 'You didn\'t change anything',
          );
          return;
        }

        final updatedTask = TaskModel(
          taskId: task.taskId,
          title: titleController.text,
          description: descriptionController.text,
          endTime: task.endTime,
          status: getstatus(endTime: task.endTime),
          userId: task.userId,
          group: cubit.selectedGroup ?? task.group,
        );

        TaskCubit.get(context).updateTask(updatedTask);
      },
    );
  }
}
