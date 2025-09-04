
import 'package:news_app/feature/weather/data/model/weather_model.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;
  WeatherSuccess(this.weatherModel);

}

final class WeatherFailure extends WeatherState {
  final String errorMessage;
  WeatherFailure(this.errorMessage);
}

