import 'dart:io';

import 'package:exam_feed/core/api/api_helper.dart';
import 'package:exam_feed/core/models/login.dart';
import 'package:exam_feed/core/models/signup.dart';

abstract class AuthRepository {
  Future<ApiResponse<SignupResponse>> signUp({
    required String email,
    required String password,
    required String confirmPassword,
    required String firstName,
  });
  Future<ApiResponse<LoginResponse>> signIn({
    required String email,
    required String password,
  });

  Future<ApiResponse<LoginResponse>> resetPassword({
    required String password,
  });
  Future<ApiResponse<LoginResponse>> emailVerification();
  Future<ApiResponse<void>> getProfile();
  Future<ApiResponse<void>> updateProfile({
    required String email,
    required String name,
  });
}
