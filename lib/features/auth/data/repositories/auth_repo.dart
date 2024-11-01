import 'dart:developer' as dev;

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:exam_feed/core/network/dio_exception.dart';
import 'package:exam_feed/core/utils/logger.dart';
import 'package:exam_feed/core/utils/typedef.dart';
import 'package:exam_feed/features/auth/data/models/auth_error.dart';
import 'package:exam_feed/features/auth/data/models/auth_register_user.dart';
import 'package:exam_feed/features/auth/data/models/auth_user.dart';
import 'package:exam_feed/features/auth/data/providers/auth_provider.dart';
import 'package:exam_feed/features/auth/data/providers/local_provider.dart';

class AuthRepository {
  final AuthProvider provider;
  // final AuthUserLocalDataSourceImpl localDataSource;
  AuthRepository({
    // required this.localDataSource,
    required this.provider,
  });

  Future<EitherAuthRegisterUserOrAuthError> registerUser({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await provider.registerUser(
        fullName: fullName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      dev.log(response.toString(), name: 'response');
      await AuthUserLocalDataSourceImpl().saveUser(AuthUser.fromJson(response));
      return right(AuthRegisterUser.fromJson(response));
    } on DioException catch (e) {
      return left(
        AuthError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode),
        ),
      );
    } catch (e) {
      return left(
        AuthError(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<EitherAuthRegisterUserOrAuthError> registerUserWithGoogle() async {
    try {
      final response = await provider.registerUserWithGoogle();
      return right(AuthRegisterUser.fromJson(response));
    } on DioException catch (e) {
      return left(
        AuthError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode),
        ),
      );
    } catch (e) {
      return left(AuthError(errorMessage: e.toString()));
    }
  }

  Future<EitherTrueOrAuthError> verifyEmail(String token) async {
    try {
      final response = await provider.verifyEmail(token: token);
      if (response['message'] == 'Email successfully verified') {
        return right(true);
      } else {
        return left(AuthError(errorMessage: "Invalid verification token."));
      }
    } catch (e) {
      return left(AuthError(errorMessage: e.toString()));
    }
  }

  Future<EitherAuthUserOrAuthError> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await provider.login(email: email, password: password);
      // final isSaved =
      //     await localDataSource.saveUser(AuthUser.fromJson(response));
      // logger.f({isSaved: isSaved});
      return right(AuthUser.fromJson(response));
    } on DioException catch (e) {
      logger.f(e.response);
      logger.e(e);

      return left(
        AuthError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode),
        ),
      );
    } catch (e) {
      return left(
        AuthError(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<Either<AuthError, bool>> forgotPassword(
      {required String email}) async {
    try {
      final response = await provider.forgotPassword(email: email);
      if (response['message'] == "Email successfully sent") {
        return right(true);
      } else {
        return left(AuthError(errorMessage: "Failed to send email"));
      }
    } on DioException catch (e) {
      return left(
        AuthError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode),
        ),
      );
    } catch (e) {
      return left(
        AuthError(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<Either<AuthError, bool>> verifyOtp(String otp) async {
    try {
      final response = await provider.verifyOtp(token: otp);
      return response;
    } catch (e) {
      return left(AuthError(errorMessage: e.toString()));
    }
  }

  // Reset Password
  Future<Either<AuthError, bool>> resetPassword({
    required String password,
  }) async {
    try {
      final response = await provider.resetPassword(
        password: password,
      );
      return response['message'] == 'Password reset successful'
          ? right(true)
          : left(AuthError(errorMessage: 'Password reset failed.'));
    } catch (e) {
      return left(AuthError(errorMessage: e.toString()));
    }
  }
}
