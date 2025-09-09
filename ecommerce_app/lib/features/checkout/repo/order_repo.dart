import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/api_response.dart';
import 'package:ecommerce_app/core/network/endpoint.dart';

class OrderRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, Unit>> placeOrder({
    required List<Map<String, dynamic>> items,
  }) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.placeOrder,
        data: {"items": items},
        isProtected: true,
        isFormData: false,
      );
      log(response.data.toString());
      if (response.status) {
        return Right(unit);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
