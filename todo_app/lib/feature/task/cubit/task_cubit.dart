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
  late final endTimeController = TextEditingController();
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
        (_) => emit(AddTaskSuccess("Task added successfully", task)),
      );
    } catch (e) {
      emit(TaskFailure(e.toString()));
    }
  }

  Future<void> getTasks() async {
    emit(LoadingTask());
    final result = await taskRepo.getTasks();
    result.fold(
      (error) => emit(TaskFailure(error)),
      (tasks) => emit(GetTaskSuccess(tasks)),
    );
  }

  // تعديل تاسك
  Future<void> updateTask(TaskModel task) async {
    emit(LoadingTask());
    try {
      final result = await taskRepo.updateTask(task);
      result.fold(
        (failure) => emit(TaskFailure(failure)),
        (task) => emit(UpdateTaskSuccess("Task added successfully", task)),
      );
    } catch (e) {
      emit(TaskFailure(e.toString()));
    }
  }

  Future<void> deleteTask(String taskId) async {
    emit(LoadingTask());
    try {
      final result = await taskRepo.deleteTask(taskId);
      result.fold(
        (failure) => emit(TaskFailure(failure)),
        (_) => emit(DeleteTaskSuccess("Task deleted successfully")),
      );
    } catch (e) {
      emit(TaskFailure(e.toString()));
    }
  }
}
