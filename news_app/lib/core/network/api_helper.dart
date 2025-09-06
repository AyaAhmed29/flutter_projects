import 'package:dio/dio.dart';
import 'api_response.dart';
import 'end_points.dart';

class ApiHelper {
  // singleton
  static final ApiHelper _instance = ApiHelper._init();
  factory ApiHelper() => _instance;
  ApiHelper._init();

  Dio _createDio({String? baseUrl}) {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl ?? EndPoints.baseUrl, // الافتراضي أخبار
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  Future<ApiResponse> getRequest({
    required String endPoint,
    String? baseUrl, // ممكن تمرري هنا BaseUrl تاني
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = true,
  }) async {
    final dio = _createDio(baseUrl: baseUrl);
    return ApiResponse.fromResponse(await dio.get(
      endPoint,
      queryParameters: queryParameters,
      data: isFormData ? FormData.fromMap(data ?? {}) : data,
    ));
  }

  Future<ApiResponse> postRequest({
    required String endPoint,
    String? baseUrl,
    Map<String, dynamic>? data,
    bool isFormData = true,
  }) async {
    final dio = _createDio(baseUrl: baseUrl);
    return ApiResponse.fromResponse(await dio.post(
      endPoint,
      data: isFormData ? FormData.fromMap(data ?? {}) : data,
    ));
  }
}
