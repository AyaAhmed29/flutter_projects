import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/home/data/model/slider_model.dart';
import 'package:ecommerce_app/features/home/data/repo_home/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit._internal() : super(SliderInitial());
  // 1. Singleton pattern
  static final SliderCubit _instance = SliderCubit._internal();
  factory SliderCubit() {
    return _instance;
  }

  // 2. Caching variable
  SliderModel? cachedSliders;
  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndex());
  }

  void getSlider({bool forceRefresh = false}) async {
    // 3. Check for cached data before fetching, unless a refresh is forced
    if (!forceRefresh &&
        cachedSliders != null &&
        cachedSliders!.sliders!.isNotEmpty) {
      emit(SliderSuccess(sliders: cachedSliders!));
      return;
    }

    HomeRepo homeRepo = HomeRepo();
    emit(SliderLoading());
    var response = await homeRepo.getSlider();
    response.fold((error) => emit(Sliderfailure(error: error)), (sliders) {
      // 4. Cache the fetched data after a successful network call
      cachedSliders = sliders;
      emit(SliderSuccess(sliders: sliders));
    });
  }
}
