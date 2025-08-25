import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo_app/core/helper/app_pop_up.dart';
import 'package:todo_app/feature/task/cubit/task_state.dart';
import 'package:todo_app/feature/task/view/widgets/add_task_view_body.dart';
import 'package:todo_app/feature/task/cubit/task_cubit.dart';

class AddTaskViwe extends StatelessWidget {
  const AddTaskViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: Builder(
        builder: (context) {
          return BlocConsumer<TaskCubit, TaskState>(
            listener: (context, state) {
              if (state is AddTaskSuccess) {
                AppPopUp.showSnackBar(context: context, text: state.successMessage);
                GoRouter.of(context).pop(true);
              }
              if (state is TaskFailure) {
                AppPopUp.showSnackBar(context: context, text: state.errorMessage);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is LoadingTask ? true : false,
                child: AddTaskViewBody(),
              );
            },
          );
        },
      ),
    );
  }
}
