import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/widgets/custom_app_bar.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/core/widgets/custom_floating_action_button.dart';
import 'package:todo_app/feature/task/cubit/task_cubit.dart';
import 'package:todo_app/feature/task/cubit/task_state.dart';
import 'package:todo_app/feature/task/view/widgets/custom_elevated_button.dart';
import 'package:todo_app/feature/task/view/widgets/task_item_widget.dart';
import 'package:todo_app/feature/task/view/widgets/task_search.dart';
import 'package:todo_app/feature/task/view/widgets/task_status_indicator.dart';
import 'package:todo_app/generated/l10n.dart';

class TodayTasksView extends StatelessWidget {
  const TodayTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit()..filterTasks(),
      child: Builder(
        builder: (innerContext) {
          return Scaffold(
            floatingActionButton: CustomFloatingActionButton(
              onPressed: () {
                filterDialog(innerContext);
              },
              icon: Assets.assetsImagesIconsFilter,
            ),
            appBar: CustomAppBar(titile: 'Tasks'),
            body: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                if (state is LoadingTask) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TaskFailure) {
                  return Center(child: Text("Error: ${state.errorMessage}"));
                } else if (state is GetTaskSuccess) {
                  final tasks = state.tasks;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        TaskSearch(),
                        TaskStatusIndicator(
                          text: S.of(context).Results,
                          number: tasks.length,
                        ),
                        ListView.builder(
                          itemCount: tasks.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final task = tasks[index];
                            return TaskItemWidget(
                              title: task.description,
                              status: task.status,
                              icon: task.group == 'Work'
                                  ? Assets.assetsImagesIconsWork
                                  : task.group == 'Home'
                                  ? Assets.assetsImagesIconsHome
                                  : task.group == 'Personal'
                                  ? Assets.assetsImagesIconsPersonal
                                  : Assets.assetsImagesIconsWork,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> filterDialog(BuildContext context) {
    final taskCubit = TaskCubit.get(context);

    return showDialog(
      context: context,
      barrierColor: Colors.black.withAlpha(100),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 15.h,
              ),
              content: SizedBox(
                width: 329.w,
                height: 381.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 15.w,
                      children: [
                        for (int i = 0; i < 4; i++)
                          CustomElevatedButton(
                            text: [
                              S.of(context).All,
                              S.of(context).Work,
                              S.of(context).Home,
                              S.of(context).Personal,
                            ][i],
                            isSelected: taskCubit.selectedTopIndex == i,
                            onTap: () {
                              setState(() {
                                taskCubit.selectedTopIndex = i;
                              });
                            },
                          ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Wrap(
                      spacing: 15.w,
                      children: [
                        for (int i = 0; i < 4; i++)
                          CustomElevatedButton(
                            text: [
                              S.of(context).All,
                              S.of(context).InProgress,
                              S.of(context).Missed,
                              S.of(context).Done,
                            ][i],
                            isSelected: taskCubit.selectedBottomIndex == i,
                            onTap: () {
                              setState(() {
                                taskCubit.selectedBottomIndex = i;
                              });
                            },
                          ),
                      ],
                    ),
                    SizedBox(height: 25.h),
                    CustomButton(
                      text: S.of(context).Filter,
                      onPressed: () {
                        taskCubit.filterTasks();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
