import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/network/api_helper.dart';
import 'package:news_app/core/network/end_points.dart';
import 'package:news_app/feature/explor/data/model/articles_model.dart';

class NewsRepo {
  Future<Either<String, ArticlesResponseModel>> getAllNews(
    String q, [
    String? sortBy,
  ]) async {
    try {
      ApiHelper apiHelper = ApiHelper();

      var response = await apiHelper.getRequest(
        endPoint: EndPoints.everything,
        queryParameters: {
          'q': q.isEmpty ? 'all' : q,
          'apiKey': '12b9dc3b4b284dfaaa2a8369e06884ce',
          'sortBy': sortBy,
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

  Future<Either<String, ArticlesResponseModel>> getByCategory(
    String category,
  ) async {
    try {
      ApiHelper apiHelper = ApiHelper();

      var response = await apiHelper.getRequest(
        endPoint: EndPoints.topHeadlines,
        queryParameters: {
          'category': category,
          'apiKey': '12b9dc3b4b284dfaaa2a8369e06884ce',
        },
      );

      if (response.status) {
        ArticlesResponseModel model = ArticlesResponseModel.fromJson(
          response.data as Map<String, dynamic>,
        );
        log(model.articles?.length.toString() ?? '0');
        log(model.articles?.first.title.toString() ?? 'No title');
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
