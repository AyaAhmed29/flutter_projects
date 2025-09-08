import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/home/data/model/slider_model.dart';
import 'package:ecommerce_app/features/home/data/repo_home/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitial());
  static SliderCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  setCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndex());
  }

  getSlider() async {
    HomeRepo homeRepo = HomeRepo();
    emit(SliderLoading());
    var response = await homeRepo.getSlider();
    response.fold((error) => emit(Sliderfailure(error: error)), (sliders) {
      emit(SliderSuccess(sliders: sliders));
    });
  }
}
