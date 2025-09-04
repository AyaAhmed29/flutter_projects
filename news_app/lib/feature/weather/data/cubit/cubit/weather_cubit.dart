import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/location/view/location_view.dart';
import 'package:news_app/feature/weather/data/cubit/cubit/weather_state.dart';
import 'package:news_app/feature/weather/data/repo/weather_repo.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  Future<void> getWeather() async {
    emit(WeatherLoading());
    try {
      WeatherRepo weatherRepo = WeatherRepo();
      var result = await weatherRepo.getWeather(lat, lon);
      result.fold(
        (failure) => emit(WeatherFailure(failure)),
        (articles) => emit(WeatherSuccess(articles)),
      );
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
