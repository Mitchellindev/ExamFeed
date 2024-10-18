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

// class AuthStateEmailVerificationLinkSent extends AuthState {
//   const AuthStateEmailVerificationLinkSent();
// }

// class AuthStatePasswordResetSent extends AuthState {
//   const AuthStatePasswordResetSent();
// }



// class AuthStateBiometricsNotEnabled extends AuthState {}

// class AuthStateBiometricsError extends AuthState {
//   final LocalAuthError error;
//   const AuthStateBiometricsError({
//     required this.error,
//   });
// }
