import 'package:exam_feed/core/network/api_endpoint.dart';
import 'package:exam_feed/core/network/dio_client.dart';
import 'package:exam_feed/core/utils/logger.dart';

class AuthProvider {
  Future<Map<String, dynamic>> registerUser({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await DioClient.instance.post(
        path: ApiRoutes.signUp,
        data: {
          "email": email,
          "fullName": fullName,
          "password": password,
          "confirmPassword": confirmPassword,
        },
      );
      return response;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioClient.instance.post(
        path: ApiRoutes.login,
        data: {
          "email": email,
          "password": password,
        },
      );
      logger.e(
        {
          "email": email,
          "password": password,
        },
      );
      return response;
    } catch (e) {
      // logger.e(e);
      rethrow;
    }
  }

  // updateUser(
  //     {required String authToken,
  //     required String dateOfBirth,
  //     required String gender,
  //     required String location,
  //     required XFile image}) {}

  // requestOtp({required String email}) {}

  // verifyOtp({required String email, required String otp}) {}
}
