import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/widgets/custom_app_bar.dart';
import 'package:todo_app/core/widgets/custom_floating_action_button.dart';
import 'package:todo_app/feature/task/cubit/task_cubit.dart';
import 'package:todo_app/feature/task/view/widgets/task_body.dart';
import 'package:todo_app/feature/task/view/widgets/task_filter_dialog.dart';
import 'package:todo_app/core/utils/app_assets.dart';

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
            appBar: const CustomAppBar(titile: 'Tasks'),
            body: const TaskBody(),
          );
        },
      ),
    );
  }
}
