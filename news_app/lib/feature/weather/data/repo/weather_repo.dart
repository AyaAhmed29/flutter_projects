// import 'dart:developer';

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:news_app/core/network/api_helper.dart';
// import 'package:news_app/core/network/end_points.dart';
// import 'package:news_app/feature/weather/data/model/weather_model.dart';

// class WeatherRepo {
//   Future<Either<String, WeatherModel>> getWeather(
//     double lat,
//     double lon,
//   ) async {
//     try {
//       ApiHelper apiHelper = ApiHelper();

//       var response = await apiHelper.getRequest(
//         baseUrl: EndPoints.weatherBaseUrl,
//         endPoint: EndPoints.weather,
//         queryParameters: {
//           'lat': lat,
//           'lon': lon,
//           'units': 'metric',
//           'appid': '39ef56aa87e0f9d833e66cd9111de959',
//         },
//       );

//       if (response.status) {
//         WeatherModel model = WeatherModel.fromJson(
//           response.data as Map<String, dynamic>,
//         );
//         log(model.toString());
//         log("Response status: ${response.statusCode}");
//         log("Response data: ${response.data}");
//         log("Response headers: ${response.message}");
//         return Right(model);
//       } else {
//         return Left(response.message);
//       }
//     } on DioException catch (e) {
//       log(e.toString());
//       var errorResponse = e.response?.data as Map<String, dynamic>;

//       log(errorResponse['message']);
//       return Left(errorResponse['message']);
//     } catch (e) {
//       log(e.toString());
//       return Left(e.toString());
//     }
//   }
// }
// //////////////////////
// ///import 'dart:developer';

import 'dart:developer' show log;

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
        baseUrl: EndPoints.weatherBaseUrl,
        endPoint: EndPoints.weather,
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'units': 'metric',
          'appid': '39ef56aa87e0f9d833e66cd9111de959',
        },
      );
      log(response.data.toString());
      log("Response status: ${response.statusCode}");

      if (response.statusCode == 200) {
        WeatherModel model = WeatherModel.fromJson(
          response.data as Map<String, dynamic>,
        );
        log(model.toString());
        log("Response status: ${response.statusCode}");
        log("Response data: ${response.data}");
        log("Response headers: ${response.message}");
        return Right(model);
      } else {
        return Left(response.message);
      }
    } on DioException catch (e) {
      log(e.toString());
      var errorResponse = e.response?.data as Map<String, dynamic>;

      log(errorResponse['message']);
      return Left(errorResponse['message']);
    } catch (e) {
      log(e.toString());
      return Left(e.toString());
    }
  }
}
