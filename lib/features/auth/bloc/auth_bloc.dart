import 'package:equatable/equatable.dart';
import 'package:exam_feed/features/auth/data/models/auth_error.dart';
import 'package:exam_feed/features/auth/data/models/auth_register_user.dart';
import 'package:exam_feed/features/auth/data/models/auth_user.dart';
import 'package:exam_feed/features/auth/data/repositories/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepo;
  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    on<AuthEventSignup>((event, emit) async {
      emit(AuthStateIsLoading());
      final res = await authRepo.registerUser(
          fullName: event.fullName,
          email: event.email,
          password: event.password,
          confirmPassword: event.confirmPassword);
      res.fold(
          (AuthError authError) => emit(AuthStateError(authError: authError)),
          (AuthRegisterUser authUser) =>
              emit(AuthStateIsRegistered(user: authUser)));
    });

    on<AuthEventLogin>((event, emit) async {
      emit(AuthStateIsLoading());
      final res = await authRepo.login(
        email: event.email,
        password: event.password,
      );
      res.fold(
          (AuthError authError) => emit(AuthStateError(authError: authError)),
          (AuthUser authUser) {
        emit(AuthStateIsLoggedIn(user: authUser));
      });
    });

    on<AuthEventForgetPassword>((event, emit) async {
      emit(AuthStateIsLoading());
      final result = await authRepo.forgotPassword(email: event.email);
      result.fold(
        (AuthError error) =>
            emit(AuthStateForgetFailure(error: error.errorMessage)),
        (_) => emit(AuthStateForgetSuccess()),
      );
    });

    on<AuthEventGoogleSignup>((event, emit) async {
      emit(AuthStateIsLoading());
      final res = await authRepo.registerUserWithGoogle();
      res.fold(
        (AuthError authError) => emit(AuthStateError(authError: authError)),
        (AuthRegisterUser authUser) =>
            emit(AuthStateIsRegistered(user: authUser)),
      );
    });

    on<AuthEventVerifyEmail>((event, emit) async {
      emit(AuthStateIsLoading());
      final result = await authRepo.verifyEmail(event.token);
      result.fold(
        (AuthError authError) => emit(AuthStateError(authError: authError)),
        (success) => emit(AuthStateEmailVerified()),
      );
    });

    // Handle OTP verification
    on<AuthEventVerifyOtp>((event, emit) async {
      emit(AuthStateIsLoading());
      final result = await authRepo.verifyOtp(event.token);
      result.fold(
        (error) =>
            emit(AuthStateOtpVerificationFailed(error: error.errorMessage)),
        (_) => emit(AuthStateOtpVerified()),
      );
    });

    // Handle Password Reset
    on<AuthEventResetPassword>((event, emit) async {
      emit(AuthStateIsLoading());
      final result = await authRepo.resetPassword(
        password: event.password,
      );
      result.fold(
        (error) =>
            emit(AuthStatePasswordResetFailed(error: error.errorMessage)),
        (_) => emit(AuthStatePasswordResetSuccess()),
      );
    });
  }
}
