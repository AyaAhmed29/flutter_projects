import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/feature/task/cubit/task_state.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';
import 'package:todo_app/feature/task/data/repo/task_repo.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  static TaskCubit get(context) => BlocProvider.of(context);

  // ======= Core Variables =======
  XFile? taskImage;
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  late final endTimeController = TextEditingController();
  DateTime? endTime;
  String? selectedGroup;

  // ======= Search and Filter Variables =======
  List<TaskModel> allTasks = []; // All loaded tasks
  String searchText = ""; // Text for search
  int selectedTopIndex = 0;
  int selectedBottomIndex = 0;

  // ======= Set Task End Time =======
  void setEndTime(DateTime dateTime) {
    endTime = dateTime;
    endTimeController.text = dateTime.toString();
    emit(TaskEndTimeChanged());
  }

  // ======= Set Task Group =======
  void setGroup(String value) {
    selectedGroup = value;
    emit(TaskGroupChanged());
  }

  // ======= Add Task =======
  void addTask(TaskModel task) async {
    TaskRepo taskRepo = TaskRepo();
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

  // ======= Fetch All Tasks =======
  void getTasks() async {
    emit(LoadingTask());
    TaskRepo taskRepo = TaskRepo();
    final result = await taskRepo.getTasks();
    result.fold((error) => emit(TaskFailure(error)), (tasks) {
      allTasks = tasks; // Save all tasks for search
      _emitFilteredTasks(); // Apply search if any text is already written
    });
  }

  // ======= Update Task =======
  Future<void> updateTask(TaskModel task) async {
    emit(LoadingTask());
    TaskRepo taskRepo = TaskRepo();
    try {
      final result = await taskRepo.updateTask(task);
      result.fold(
        (failure) => emit(TaskFailure(failure)),
        (task) => emit(UpdateTaskSuccess("Task updated successfully", task)),
      );
    } catch (e) {
      emit(TaskFailure(e.toString()));
    }
  }

  // ======= Delete Task =======
  void deleteTask(String taskId) async {
    TaskRepo taskRepo = TaskRepo();
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

  // ======= Filter Tasks by Day and Status =======
  void filterTasks() {
    String selectedGroup = [
      "All",
      "Work",
      "Home",
      "Personal",
    ][selectedTopIndex];
    String selectedStatus = [
      "All",
      "In Progress",
      "Missed",
      "Done",
    ][selectedBottomIndex];

    getToday({required String group, required String status}) async {
      emit(LoadingTask());
      TaskRepo taskRepo = TaskRepo();
      try {
        final result = await taskRepo.getTodayTasks(
          group: group,
          status: status,
        );

        result.fold((failure) => emit(TaskFailure(failure)), (tasks) {
          allTasks = tasks; // Save tasks after filtering
          _emitFilteredTasks(); // Apply search if text exists
        });
      } catch (e) {
        emit(TaskFailure(e.toString()));
      }
    }

    getToday(group: selectedGroup, status: selectedStatus);
  }

  // ======= Update Search Text =======
  void updateSearch(String value) {
    searchText = value.toLowerCase();
    _emitFilteredTasks();
  }

  // ======= Apply Search on Tasks =======
  void _emitFilteredTasks() {
    final filtered = allTasks.where((task) {
      return task.description.toLowerCase().contains(searchText);
    }).toList();

    emit(GetTaskSuccess(filtered));
  }
}
