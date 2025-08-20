
import 'package:todo_app/feature/task/data/model/task_model.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeEmpty extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeTasksLoaded extends HomeState {
  final List<TaskModel> tasks;

  HomeTasksLoaded(this.tasks);
}

final class HomeFailure extends HomeState {
  final String errorMessage;

  HomeFailure(this.errorMessage);
}