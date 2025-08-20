import 'package:todo_app/feature/task/data/model/task_model.dart';

sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskEndTimeChanged extends TaskState {}

final class TaskGroupChanged extends TaskState {}

final class LoadingTask extends TaskState {}

final class AddTaskSuccess extends TaskState {
  final String successMessage;

  AddTaskSuccess(this.successMessage);
}

final class GetTaskSuccess extends TaskState {
  final List<TaskModel> tasks;

  GetTaskSuccess(this.tasks);
}

final class TaskFailure extends TaskState {
  final String errorMessage;

  TaskFailure(this.errorMessage);
}
