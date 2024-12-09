import 'package:exam_feed/core/api/api_helper.dart';
import 'package:exam_feed/core/models/login.dart';
import 'package:exam_feed/core/models/signup.dart';
import 'package:exam_feed/features/auth/repository/auth_repository.dart';

final class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._apiHandler);

  final ApiHandler _apiHandler;

  @override
  Future<ApiResponse<SignupResponse>> signUp({
    required String email,
    required String password,
    required String confirmPassword,
    required String firstName,
  }) {
    return _apiHandler.request(
      path: 'auth/signUp',
      method: MethodType.post,
      payload: {
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'fullName': firstName
      },
      authenticate: false,
      responseMapper: SignupResponse.fromJson,
    );
  }

  @override
  Future<ApiResponse<LoginResponse>> signIn({
    required String email,
    required String password,
  }) {
    return _apiHandler.request<LoginResponse>(
      path: 'auth/login',
      method: MethodType.post,
      responseMapper: LoginResponse.fromJson,
      payload: {
        'email': email,
        'password': password,
      },
      authenticate: false,
    );
  }

  @override
  Future<ApiResponse<LoginResponse>> resetPassword({
    required String password,
  }) {
    return _apiHandler.request<LoginResponse>(
      path: 'account/reset-password/',
      method: MethodType.put,
      // responseMapper: LoginResponse.fromJson,
      payload: {
        'password': password,
      },
      authenticate: false,
    );
  }

  @override
  Future<ApiResponse<LoginResponse>> emailVerification() {
    return _apiHandler.request<LoginResponse>(
      path: 'account/resend-otp/',
      method: MethodType.get,
    );
  }

  @override
  Future<ApiResponse<void>> getProfile() {
    return _apiHandler.request<void>(
      path: 'auth/getuserprofile',
      method: MethodType.get,
      // responseMapper: LoginResponse.fromJson,
    );
  }

  @override
  Future<ApiResponse<void>> updateProfile({
    required String email,
    required String name,
  }) {
    return _apiHandler.request<void>(
      path: 'auth/updateprofile',
      method: MethodType.put,
      queryParameters: {
        'userEmail': email,
        'fullName': name,
      },
      // responseMapper: LoginResponse.fromJson,
    );
  }
}
