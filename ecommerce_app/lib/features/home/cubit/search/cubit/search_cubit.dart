import 'package:ecommerce_app/features/home/cubit/search/cubit/search_state.dart';
import 'package:ecommerce_app/features/home/data/repo_home/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
 static SearchCubit get(context) => BlocProvider.of(context);

var searchController = TextEditingController();

  searchProducts() async {
    emit(SearchLoading());
    try {
      var response = await HomeRepo().searchProducts(searchController.text); 
      response.fold(
        (error) => emit(SearchFailure(error: error)),
        (model) => emit(SearchSuccess(products: model)),
      );
    } catch (e) {
      emit(SearchFailure(error: e.toString()));
    }
  }
}
