import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/endpoint.dart';
import 'package:ecommerce_app/features/auth/data/model/user_model.dart';
import 'package:image_picker/image_picker.dart';

class UserRepo {
  ApiHelper apiHelper = ApiHelper();
  Future<Either<String, UserModel>> getUser() async {
    try {
      var response = await apiHelper.getRequest(
        endPoint: EndPoints.getUserData,
        isProtected: true,
      );
      if (response.status) {
        var data = response.data as Map<String, dynamic>;

        LoginResponseModel responseModel = LoginResponseModel.fromJson(data);
        log(responseModel.user!.imagePath.toString());
        log(responseModel.user!.name.toString());
        log(responseModel.user!.phone.toString());
        
        return right(responseModel.user!);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Unit>> updateUser(
    String name,
    XFile? image,
    String phone,
  ) async {
    try {
      var response = await apiHelper.putRequest(
        endPoint: EndPoints.updateProfile,
        data: {
          'name': name,
          'phone': phone,
          if (image != null)
            'image': await MultipartFile.fromFile(
              image.path,
              filename: image.name,
            ),
        },
        isProtected: true,
      );

      if (response.status) {
        log('تم التحديث بنجاح');
        return const Right(unit);
      } else {
        log('فشل التحديث: ${response.message}');
        return Left(response.message);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
