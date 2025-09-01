import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/widgets/taskList_shimmer.dart';
import 'package:todo_app/feature/task/cubit/task_cubit.dart';
import 'package:todo_app/feature/task/cubit/task_state.dart';
import 'package:todo_app/core/widgets/task_item_widget.dart';
import 'package:todo_app/feature/task/view/widgets/task_search.dart';
import 'package:todo_app/feature/task/view/widgets/task_status_indicator.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/core/utils/app_assets.dart';

class TaskBody extends StatelessWidget {
  const TaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        if (state is LoadingTask) {
          return TaskListShimmer();
        } else if (state is TaskFailure) {
          return Center(child: Text("Error: ${state.errorMessage}"));
        } else if (state is GetTaskSuccess) {
          final tasks = state.tasks;
          return SingleChildScrollView(
            child: Column(
              children: [
                const TaskSearch(),
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
                      image: task.imageUrl,

                      title: task.description,
                      status: task.status,
                    );
                  },
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
