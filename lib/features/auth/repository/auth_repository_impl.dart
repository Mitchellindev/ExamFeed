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

  // @override
  // Future<ApiResponse<void>> verifyOtp({required String otp}) {
  //   return _apiHandler.request<void>(
  //     path: 'account/verify-otp/',
  //     method: MethodType.post,
  //     payload: {'otp': otp},
  //   );
  // }

  // @override
  // Future<ApiResponse<void>> generateResetPasswordOtp({required String email}) {
  //   return _apiHandler.request<void>(
  //     path: 'account/recover-account/',
  //     method: MethodType.post,
  //     payload: {'email': email},
  //   );
  // }

  // @override
  // Future<ApiResponse<void>> verifyResetPasswordOtp({
  //   required String email,
  //   required String otp,
  // }) {
  //   return _apiHandler.request<void>(
  //     path: 'account/validate-recovery-otp/',
  //     method: MethodType.patch,
  //     payload: {'email': email, 'otp': otp},
  //   );
  // }

  // @override
  // Future<ListApiResponse<Country>> getCountryList() {
  //   return _apiHandler.requestList<Country>(
  //     path: 'account/country/',
  //     method: MethodType.get,
  //     responseMapper: Country.fromJson,
  //     payload: {},
  //   );
  // }

  // @override
  // Future<ApiResponse<void>> completeRegistration({
  //   required String firstName,
  //   required String lastName,
  //   required String gender,
  //   required String dob,
  //   required String countryId,
  //   required String maritalStatus,
  // }) {
  //   return _apiHandler.request<void>(
  //     path: 'account/complete-registration/',
  //     method: MethodType.patch,
  //     payload: {
  //       'first_name': firstName,
  //       'last_name': lastName,
  //       'gender': gender,
  //       'd_o_b': dob,
  //       'country_id': countryId,
  //       'marital_status': maritalStatus,
  //     },
  //   );
  // }

  // @override
  // Future<ApiResponse<void>> resetPassword({
  //   required String email,
  //   required String password,
  //   required String confirmPassword,
  // }) {
  //   return _apiHandler.request<void>(
  //     path: 'account/set-password/',
  //     method: MethodType.patch,
  //     payload: {
  //       'email': email,
  //       'new_password': password,
  //       'confirm_password': confirmPassword,
  //     },
  //   );
  // }

  // @override
  // Future<ApiResponse<void>> updateUsername({required String username}) {
  //   return _apiHandler.request<void>(
  //     path: 'account/update-username/',
  //     method: MethodType.patch,
  //     payload: {'username': username},
  //   );
  // }

  // @override
  // Future<ApiResponse<bool>> validateUsername({required String username}) {
  //   return _apiHandler.request<bool>(
  //     path: 'account/validate-username/',
  //     method: MethodType.get,
  //     queryParameters: {'username': username},
  //     responseMapper: (json) {
  //       return json['message'] == 'Username is available';
  //     },
  //   );
  // }

  // @override
  // Future<ApiResponse<PaginationResponse<String>>> fetchPreferenceList({
  //   required int page,
  // }) {
  //   return _apiHandler.request<PaginationResponse<String>>(
  //     path: 'account/preferences/',
  //     method: MethodType.get,
  //     queryParameters: {'page': page},
  //     responseMapper: (value) {
  //       return PaginationResponse<String>.fromJson(
  //         value,
  //         (json) => (json! as Map<String, dynamic>)['name'] as String,
  //       );
  //     },
  //   );
  // }

  // @override
  // Future<ApiResponse<void>> addPreferences(List<String> preferences) {
  //   return _apiHandler.request<void>(
  //     path: 'account/user-preferences/',
  //     method: MethodType.post,
  //     payload: {'list_of_preferences': preferences},
  //   );
  // }
}
