import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

class CloudinaryService {
  static const String cloudName = "deymczz9q";
  static const String uploadPreset = "ml_default"; 

  static Future<String?> uploadImage(File imageFile) async {
    final url = "https://api.cloudinary.com/v1_1/$cloudName/image/upload";

    final formData = FormData.fromMap({
      'upload_preset': uploadPreset,
      'file': await MultipartFile.fromFile(imageFile.path),
    });

    try {
      final response = await Dio().post(url, data: formData);
      if (response.statusCode == 200) {
        return response.data["secure_url"]; 
      } else {
        return null;
      }
    } catch (e) {
      log("Upload Error: $e");
      return e.toString();
    }
  }
}
