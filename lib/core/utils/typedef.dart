import 'package:dartz/dartz.dart';
import 'package:exam_feed/features/auth/data/models/auth_error.dart';
import 'package:exam_feed/features/auth/data/models/auth_register_user.dart';
import 'package:exam_feed/features/auth/data/models/auth_user.dart';

typedef EitherAuthUserOrAuthError = Either<AuthError, AuthUser>;
typedef EitherAuthRegisterUserOrAuthError = Either<AuthError, AuthRegisterUser>;
typedef EitherTrueOrAuthError = Either<AuthError, bool>;

typedef EitherMap = Either<String, Future<Map<String, dynamic>>>;
typedef EitherFutureTrueOrAuthError = Future<Either<AuthError, bool>>;
// typedef EitherFutureTodoErrorOrTodoModel = Either<TodoError, TodosModel>;
