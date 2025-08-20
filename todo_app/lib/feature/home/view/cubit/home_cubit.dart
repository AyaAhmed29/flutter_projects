import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/home/view/cubit/home_state.dart';
import 'package:todo_app/feature/task/data/repo/task_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  final TaskRepo _taskRepo = TaskRepo();

  Future<void> loadTasks() async {
    emit(HomeLoading());

    final result = await _taskRepo.getTasks(); // استدعاء نفس الدالة
    result.fold((error) => emit(HomeFailure(error)), (tasks) {
      if (tasks.isEmpty) {
        emit(HomeEmpty()); // حالة جديدة للقائمة الفاضية
      } else {
        emit(HomeTasksLoaded(tasks));
      }
    });
  }
}
