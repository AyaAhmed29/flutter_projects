import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/home/data/model/Category_moder.dart';
import 'package:ecommerce_app/features/home/data/model/prodect_model.dart';
import 'package:ecommerce_app/features/home/data/repo_home/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit() : super(BestSellerInitial());
  static BestSellerCubit get(context) => BlocProvider.of(context);
  bool _hasLoaded = false;
  BestSellerModel? _cachedData;

  Future<void> getBestSeller({bool refresh = false}) async {
    if (_hasLoaded && !refresh) {
      emit(BestSellerSuccess(bestSellerProducts: _cachedData!));
      return;
    }

    emit(BestSellerLoading());
    try {
      var response = await HomeRepo().getBestProdect();

      response.fold((error) => emit(BestSellerfailure(error: error)), (model) {
        _cachedData = model;
        _hasLoaded = true;
        log('دخل الكيوبت ');
        emit(BestSellerSuccess(bestSellerProducts: model));
      });
    } catch (e) {
      emit(BestSellerfailure(error: e.toString()));
    }
  }
}
