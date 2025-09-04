import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/network/api_helper.dart';
import 'package:news_app/core/network/end_points.dart';
import 'package:news_app/feature/weather/data/model/weather_model.dart';

class WeatherRepo {
  Future<Either<String, WeatherModel>> getWeather(
    double lat,
    double lon,
  ) async {
    try {
      ApiHelper apiHelper = ApiHelper();

      var response = await apiHelper.getRequest(
        endPoint: EndPoints.weather,
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'units': 'metric',
          'appid': '12b9dc3b4b284dfaaa2a8369e06884ce',
        },
      );

      if (response.status) {
        WeatherModel model = WeatherModel.fromJson(
          response.data as Map<String, dynamic>,
        );
        return Right(model);
      } else {
        return Left(response.message);
      }
    } on DioException catch (e) {
      var errorResponse = e.response?.data as Map<String, dynamic>;

      log(errorResponse['message']);
      return Left(errorResponse['message']);
    } catch (e) {
      log(e.toString());
      return Left(e.toString());
    }
  }
}
