import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/task/cubit/task_state.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';
import 'package:todo_app/feature/task/data/repo/task_repo.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  static TaskCubit get(context) => BlocProvider.of(context);

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  final endTimeController = TextEditingController();
  DateTime? endTime;
  String? selectedGroup;
  void setEndTime(DateTime dateTime) {
    endTime = dateTime;
    endTimeController.text = dateTime.toString();
    emit(TaskEndTimeChanged());
  }

  void setGroup(String value) {
    selectedGroup = value;
    emit(TaskGroupChanged());
  }

  TaskRepo taskRepo = TaskRepo();

  Future<void> addTask(TaskModel task) async {
    emit(LoadingTask());
    try {
      final result = await taskRepo.addTask(task);
      result.fold(
        (failure) => emit(TaskFailure(failure)),
        (_) => emit(AddTaskSuccess("Task added successfully")),
      );
    } catch (e) {
      emit(TaskFailure(e.toString()));
    }
  }

  void fetchTasks() async {
    emit(LoadingTask());

  
    // if (userId == null) {
    //   emit(TaskFailure("User ID not found"));
    //   return;
    // }

    // taskRepo.fetchTasks(userId).listen((either) {
    //   either.fold((failure) => emit(TaskFailure(failure)), (tasks) {
    //     if (tasks.isEmpty) {
    //       emit(TaskFailure('No tasks found, add new task'));
    //     } else {
    //       emit(GetTaskSuccess(tasks));
    //     }
    //   });
    // }, onError: (e) => emit(TaskFailure(e.toString())));
  }
}
