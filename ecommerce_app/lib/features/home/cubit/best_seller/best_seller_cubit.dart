import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/home/data/model/prodect_model.dart';
import 'package:ecommerce_app/features/home/data/repo_home/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  // 1. Singleton pattern implementation
  BestSellerCubit._internal() : super(BestSellerInitial());
  static final BestSellerCubit _instance = BestSellerCubit._internal();
  factory BestSellerCubit() {
    return _instance;
  }

  // 2. Caching variable
  BestSellerModel? _cachedData;
  bool _hasLoaded = false;

  Future<void> getBestSeller({bool refresh = false}) async {
    // Check for cached data before fetching, unless a refresh is forced
    if (_hasLoaded && !refresh && _cachedData != null) {
      emit(BestSellerSuccess(bestSellerProducts: _cachedData!));
      return;
    }

    emit(BestSellerLoading());

    var response = await HomeRepo().getBestProdect();

    response.fold(
      (error) => emit(BestSellerfailure(error: error)),
      (model) {
        // Cache the fetched data after a successful network call
        _cachedData = model;
        _hasLoaded = true;
        log('Data fetched and cached.');
        emit(BestSellerSuccess(bestSellerProducts: model));
      },
    );
  }
}
