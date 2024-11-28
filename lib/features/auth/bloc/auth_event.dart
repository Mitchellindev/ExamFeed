// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthEventSignup extends AuthEvent {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;

  const AuthEventSignup({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

class AuthEventLogin extends AuthEvent {
  final String email;
  final String password;
  const AuthEventLogin({
    required this.email,
    required this.password,
  });
}

class AuthEventForgetPassword extends AuthEvent {
  final String email;

  const AuthEventForgetPassword(this.email);
}

class AuthEventGoogleSignup extends AuthEvent {
  const AuthEventGoogleSignup();
}

class AuthEventVerifyEmail extends AuthEvent {
  final String token;
  const AuthEventVerifyEmail({required this.token});
}

class AuthEventVerifyOtp extends AuthEvent {
  final String token;
  const AuthEventVerifyOtp({required this.token});
}

class AuthEventResetPassword extends AuthEvent {
  final String password;
  final String token;
  const AuthEventResetPassword({required this.password, required this.token});
}

class LogoutEvent extends AuthEvent {}
