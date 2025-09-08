import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/home/data/model/best_seller_model.dart';
import 'package:ecommerce_app/features/home/data/repo_home/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit() : super(BestSellerInitial());
  static BestSellerCubit get(context) => BlocProvider.of(context);

  getBestSeller() async {
    emit(BestSellerLoading());
    try {
      var response = await HomeRepo().getBestCategory();

      response.fold(
        (error) => emit(BestSellerfailure(error: error)),
        (model) => emit(BestSellerSuccess(bestSellerProducts: model)),
      );
    } catch (e) {
      emit(BestSellerfailure(error: e.toString()));
    }
  }
}
