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
}
