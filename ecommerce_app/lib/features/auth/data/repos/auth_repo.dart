import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/api_response.dart';
import 'package:ecommerce_app/core/network/endpoint.dart';

class AuthRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, Unit>> register({
    required String phone,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.register,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        },
      );

      if (response.status) {
        return right(unit);
      } else {
        return left(response.message);
      }
    } catch (e) {
      log(e.toString());
      return Left(ApiResponse.fromError(e).message);
    }
  }

  Future<Either<String, Unit>> login({
   
    required String email,
    required String password,
  }) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.login,
        data: {
          'email': email,
          'password': password,
         
        },
      );
      if (response.status) {
        return right(unit);
      } else {
        return left(response.message);
      }
    } catch (e) {
      log(e.toString());
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
