import 'package:exam_feed/app/service_locator.dart';
import 'package:exam_feed/core/api/api_helper.dart';
import 'package:exam_feed/core/models/login.dart';
import 'package:exam_feed/core/models/signup.dart';
import 'package:exam_feed/core/storage/cache_storage.dart';
import 'package:exam_feed/features/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  static AuthenticationProvider? _instance;

  AuthenticationProvider() {
    _authRepository = locator.get<AuthRepository>();
  }

  static AuthenticationProvider get instance {
    _instance ??= AuthenticationProvider();
    return _instance!;
  }

  late final AuthRepository _authRepository;
  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;
  set loginLoading(bool value) {
    _loginLoading = value;
    notifyListeners();
  }

  late LoginResponse _loginResponse;
  LoginResponse get loginResponse => _loginResponse;

  Future<void> login({
    required String email,
    required String password,
    required VoidCallback onSuccess,
    required Function(ApiError val) onError,
  }) async {
    loginLoading = true;
    final response = await locator.get<AuthRepository>().signIn(
          email: email,
          password: password,
        );
    response.when(
      success: (data) async {
        loginLoading = false;
        _loginResponse = data?.data ?? LoginResponse();
        locator.get<SharedPrefs>().accessToken = _loginResponse.accessToken;
        print(locator.get<SharedPrefs>().accessToken);
        // await getProfile(onSuccess: onSuccess, onError: onError);
        onSuccess();
        notifyListeners();
      },
      error: (error) {
        loginLoading = false;
        onError(error);
      },
    );
  }

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;
  set signUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  late final SignupResponse _signupResponse;
  SignupResponse get signupResponse => _signupResponse;
  Future<void> signUp({
    required String email,
    required String password,
    required String confirmPassword,
    required String firstName,
    required VoidCallback onSuccess,
    required Function(ApiError val) onError,
  }) async {
    signUpLoading = true;
    final response = await _authRepository.signUp(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        firstName: firstName);
    response.when(
      success: (data) {
        signUpLoading = false;
        _signupResponse = data?.data ?? SignupResponse.empty();
        notifyListeners();
        onSuccess();
      },
      error: (error) {
        signUpLoading = false;
        onError(error);
      },
    );
  }

  Future<void> getProfile({
    required VoidCallback onSuccess,
    required Function(ApiError val) onError,
  }) async {
    final response = await _authRepository.getProfile();
    response.when(
      success: (data) {
        notifyListeners();
        onSuccess();
      },
      error: (error) {
        onError(error);
      },
    );
  }

  Future<void> updateProfile({
    required String email,
    required String name,
    required VoidCallback onSuccess,
    required Function(ApiError val) onError,
  }) async {
    final response =
        await _authRepository.updateProfile(email: email, name: name);
    response.when(
      success: (data) {
        notifyListeners();
        onSuccess();
      },
      error: (error) {
        onError(error);
      },
    );
  }
}
