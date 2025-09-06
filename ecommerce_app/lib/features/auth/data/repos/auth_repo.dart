import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/network/api_helper.dart';
import 'package:ecommerce_app/core/network/api_response.dart';
import 'package:ecommerce_app/core/network/endpoint.dart';
import 'package:ecommerce_app/features/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  ApiHelper apiHelper = ApiHelper();
  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.login,
        data: {'email': email, 'password': password},
      );
      if (response.status) {
        LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
          response.data as Map<String, dynamic>,
        );

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString(
          'access_token',
          loginResponseModel.accessToken!,
        );
        sharedPreferences.setString(
          'refresh_token',
          loginResponseModel.refreshToken!,
        );

        return Right(loginResponseModel.user!);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      print(e);
      return Left(ApiResponse.fromError(e).message);
    }
  }

  Future<Either<String, Unit>> register({
    required String phone,
    required String name,
    required String email,
    required String password,
    // XFile? image
  }) async {
    try {
      final Map<String, dynamic> data = {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      };

      // If image exists, attach as file
      // if (image != null) {
      //   data['image'] = await MultipartFile.fromFile(
      //     image.path,
      //     filename: image.name,
      //   );
      // }
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.register,
        data: data,
      );
      if (response.status) {
        login(email: email, password: password);
        return right(unit);
      } else {
        return left(response.message);
      }
    } catch (e) {
      print(e);
      return Left(ApiResponse.fromError(e).message);
    }
  }
}