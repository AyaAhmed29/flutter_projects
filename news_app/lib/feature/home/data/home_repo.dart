import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/network/api_helper.dart';
import 'package:news_app/core/network/end_points.dart';
import 'package:news_app/feature/explor/data/model/articles_model.dart';

class HomeRepo {
  Future<Either<String, ArticlesResponseModel>> getPopularityNews() async {
    try {
      ApiHelper apiHelper = ApiHelper();

      var response = await apiHelper.getRequest(
        endPoint: EndPoints.everything,
        queryParameters: {
          'q': 'all',
          'apiKey': '13d444451a7d42feaf7dcfaee17500ee',
          'sortBy': 'popularity',
        },
      );

      if (response.status) {
        ArticlesResponseModel model = ArticlesResponseModel.fromJson(
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
