import 'package:dio/dio.dart';
import 'package:exam_feed/core/network/api_endpoint.dart';
import 'package:exam_feed/core/network/dio_client.dart';
import 'package:exam_feed/core/utils/logger.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends DioClient {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<Map<String, dynamic>> registerUser({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await http.post(
        ApiRoutes.signUp,
        data: {
          "email": email,
          "fullName": fullName,
          "password": password,
          "confirmPassword": confirmPassword,
        },
      );
      return response.data;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> registerUserWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final response = await http.post(
          ApiRoutes.signUpWithGoogle,
          data: {
            "email": googleUser.email,
            "fullName": googleUser.displayName,
            "googleId": googleUser.id,
          },
        );
        return response.data;
      } else {
        throw Exception("Google Sign-In canceled");
      }
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> verifyEmail({
    required String token,
  }) async {
    try {
      final response = await http.post(
        ApiRoutes.verifyEmail,
        data: {
          "token": token,
        },
      );
      return response.data;
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
      final response = await http.post(
        ApiRoutes.login,
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
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> forgotPassword({required String email}) async {
    try {
      final response = await http.post(
        ApiRoutes.forgetPassword,
        data: {
          "email": email,
        },
      );
      return response.data;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> verifyOtp({
    required String token,
  }) async {
    try {
      final response = await http.post(
        ApiRoutes.verifToken,
        data: {"token": token},
      );
      return response.data;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> resetPassword({
    required String password,
    required String token,
  }) async {
    try {
      final response = await http.post(ApiRoutes.resetPassword,
          data: {
            "password": password,
          },
          options: Options(
            headers: {
              "Authorization":
                  "Bearer $token", // Use the token in the Authorization header
            },
          ));
      return response.data;
    } catch (e) {
      logger.e(e);
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
