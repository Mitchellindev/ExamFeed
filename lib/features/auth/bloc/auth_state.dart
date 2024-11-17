// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

// class AuthStateIsNotLoggedIn extends AuthState {}

// class AuthStateIsLoggedIn extends AuthState {
//   const AuthStateIsLoggedIn();

//   @override
//   List<Object> get props => [];
// }
class AuthInitial extends AuthState {}

class AuthStateIsLoading extends AuthState {}

class AuthStateError extends AuthState {
  final AuthError authError;
  const AuthStateError({
    required this.authError,
  });
}

class AuthStateIsLoggedIn extends AuthState {
  final AuthUser user;
  const AuthStateIsLoggedIn({
    required this.user,
  });
}

class AuthStateIsRegistered extends AuthState {
  final AuthRegisterUser user;
  const AuthStateIsRegistered({
    required this.user,
  });
}

class AuthStateForgetSuccess extends AuthState {}

class AuthStateForgetFailure extends AuthState {
  final String error;

  const AuthStateForgetFailure({required this.error});
}

class AuthStateEmailVerified extends AuthState {}

class AuthStateEmailNotVerified extends AuthState {
  final String message;
  const AuthStateEmailNotVerified({required this.message});
}

class AuthStateOtpVerified extends AuthState {}

class AuthStatePasswordResetSuccess extends AuthState {}

class LogoutSuccess extends AuthState {}
