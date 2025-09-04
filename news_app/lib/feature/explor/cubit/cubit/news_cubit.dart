import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/explor/cubit/cubit/news_state.dart';
import 'package:news_app/feature/explor/data/repo/news_repo.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);
  int selectedTopIndex = 0;
  final searchController = TextEditingController();
  Future<void> fetchNews() async {
    emit(NewsLoading());
    try {
      NewsRepo newsRepo = NewsRepo();
      var result = await newsRepo.getAllNews(searchController.text);
      result.fold(
        (failure) => emit(NewsFailure(failure)),
        (articles) => emit(NewsSuccess(articles)),
      );
    } catch (e) {
      emit(NewsFailure(e.toString()));
    }
  }
}
