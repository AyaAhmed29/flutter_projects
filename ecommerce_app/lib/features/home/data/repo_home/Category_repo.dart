import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/api_response.dart';
import 'package:ecommerce_app/core/network/endpoint.dart';
import 'package:ecommerce_app/features/home/data/model/Category_moder.dart';

class HomeRepo {
  ApiHelper apiHelper = ApiHelper();
  Future<Either<String, List<CategoryModel>>> getFeatur() async {
    try {
      var response = await apiHelper.getRequest(
        endPoint: EndPoints.getFeatur,
        isProtected: true,
      );
      if (response.status) {
        MenuResponseModel fatures = MenuResponseModel.fromJson(
          response.data as Map<String, dynamic>,
        );
        return Right(fatures.categories!);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }

  Future<Either<String, Map<String, dynamic>>> addFavorite(productid) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.addFavorite,
        data: {'product_id': productid},
        isProtected: true,
      );
      if (response.status) {
        log(response.data.toString());
        return Right(response.data);
      } else {
        log(response.message);
        return Left(response.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
