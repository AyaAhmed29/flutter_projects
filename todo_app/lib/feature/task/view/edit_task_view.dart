import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo_app/core/service/show_snack_bar.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
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
                showSnackBar(context: context, text: state.successMessage);
                Navigator.pop(context);
              } else if (state is TaskFailure) {
                showSnackBar(context: context, text: state.errorMessage);
              }
            },
            builder: (context, state) {
              return Scaffold(
                appBar: EditTaskAppBar(
                  onPressed: () {
                    final cubit = TaskCubit.get(context);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(S.of(context).ConfirmDeletion),
                        content: Text(
                          S.of(context).AreYouSureYouWantToDeleteThisTask,
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // يغلق الدايلوج
                                },
                                child: Text(
                                  S.of(context).no,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),

                              TextButton(
                                onPressed: () {
                                  cubit.deleteTask(task.taskId!);
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  showSnackBar(
                                    context: context,
                                    text: S.of(context).TaskDeletedSuccessfully,
                                  );
                                },
                                child: Text(
                                  S.of(context).yes,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),

                body: ModalProgressHUD(
                  inAsyncCall: state is LoadingTask,

                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100.h,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: CircleAvatar(
                                  radius: 40.r,
                                  backgroundImage: AssetImage(
                                    Assets.assetsImagesProfile,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S.of(context).InProgress,
                                      style: AppStyle.light12,
                                    ),
                                    Text(
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                      S.of(context).BelieveYouCan,
                                      style: AppStyle.light12.copyWith(
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomDropdownField(
                          color: AppColors.white,
                          hasBorder: false,
                          value:
                              TaskCubit.get(context).selectedGroup ??
                              task.group,
                          onChanged: (String? newValue) {
                            TaskCubit.get(context).setGroup(newValue!);
                          },
                        ),

                        CustomEditTask(
                          text: S.of(context).Title,
                          controller: titleController,
                        ),
                        SizedBox(height: 16),

                        CustomEditTask(
                          text: S.of(context).Description,
                          controller: descriptionController,
                        ),
                        SizedBox(height: 16),
                        GestureDetector(
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(
                                  selectedDate,
                                ),
                              );
                              if (pickedTime != null) {
                                selectedDate = DateTime(
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
                                SvgPicture.asset(
                                  Assets.assetsImagesIconsCalendar,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  DateFormat(
                                    'd MMMM, yyyy   h:mm a',
                                  ).format(selectedDate),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 18.h),
                        CustomButton(
                          text: S.of(context).MarkAsDone,
                          onPressed: () {
                            if (task.isDone) {
                              errorShowSnackBar(
                                context: context,
                                text: S
                                    .of(context)
                                    .ThisTaskIsAlreadyMarkedAsDone,
                              );
                              return;
                            }
                            if (task.status == 'Missed') {
                              errorShowSnackBar(
                                context: context,
                                text: S.of(context).taskismissing,
                              );

                              return;
                            }

                            final updatedTask = TaskModel(
                              status: 'In Progress',
                              taskId: task.taskId,
                              title: task.title,
                              description: task.description,
                              endTime: task.endTime,
                              userId: task.userId,
                              group:
                                  TaskCubit.get(context).selectedGroup ??
                                  task.group,
                              isDone: true,
                            );

                            TaskCubit.get(context).updateTask(updatedTask);
                            showSnackBar(
                              context: context,
                              text: S.of(context).TaskAlreadyDone,
                            );
                          },
                        ),

                        CustomButton(
                          color: AppColors.white,
                          text: S.of(context).Update,
                          onPressed: () {
                            if (titleController.text == task.title &&
                                descriptionController.text ==
                                    task.description &&
                                selectedDate == task.endTime &&
                                TaskCubit.get(context).selectedGroup ==
                                    task.group) {
                              showSnackBar(
                                context: context,
                                text: S.of(context).Youdidntchangeanything,
                              );
                              return;
                            }

                            final updatedTask = TaskModel(
                              status: getstatus(
                                endTime: selectedDate,
                                isDone: task.isDone,
                              ),
                              taskId: task.taskId,
                              title: titleController.text,
                              description: descriptionController.text,
                              endTime: selectedDate,
                              userId: task.userId,
                              group:
                                  TaskCubit.get(context).selectedGroup ??
                                  task.group, 
                            );

                            TaskCubit.get(context).updateTask(updatedTask);
                          },
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
