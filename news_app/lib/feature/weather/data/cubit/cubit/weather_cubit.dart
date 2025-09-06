import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/location/view/location_view.dart';
import 'package:news_app/feature/weather/data/cubit/cubit/weather_state.dart';
import 'package:news_app/feature/weather/data/model/weather_model.dart';
import 'package:news_app/feature/weather/data/repo/weather_repo.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit._internal() : super(WeatherInitial());

  static final WeatherCubit _instance = WeatherCubit._internal();

  factory WeatherCubit() => _instance;

  WeatherModel? cachedWeather;

  Future<void> getWeather() async {
    if (cachedWeather != null) {
      emit(WeatherSuccess(cachedWeather!));
      return;
    }

    emit(WeatherLoading());
    try {
      WeatherRepo weatherRepo = WeatherRepo();
      var result = await weatherRepo.getWeather(lat, lon);

      result.fold((failure) => emit(WeatherFailure(failure)), (weatherData) {
        cachedWeather = weatherData;
        emit(WeatherSuccess(weatherData));
      });
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
