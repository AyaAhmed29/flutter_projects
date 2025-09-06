import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/feature/explor/data/model/articles_model.dart';
import 'package:news_app/feature/home/data/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> fetchPopularityNews() async {
    emit(HomeLoading());
    try {
      HomeRepo homeRepo = HomeRepo();
      var result = await homeRepo.getPopularityNews();
      result.fold(
        (failure) => emit(HomeFailure(failure)),
        (articles) => emit(HomeSuccess(articles)),
      );
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
