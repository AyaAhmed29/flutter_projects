import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/home/data/repo/home_repo.dart';
import 'package:todo_app/feature/home/view/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  final  HomeRepo homeRepo = HomeRepo();

  void loadTasks() {
    emit(HomeLoading());

    homeRepo.getTasks().listen((either) {
      either.fold(
        (error) => emit(HomeFailure(error)),
        (tasks) {
          if (tasks.isEmpty) {
            emit(HomeEmpty());
          } else {
            emit(HomeTasksLoaded(tasks));
          }
        },
      );
    });
  }
}
