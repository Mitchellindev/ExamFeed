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

// class AuthEventLogout extends AuthEvent {
//   const AuthEventLogout();
// }

// class AuthEventSendEmailVerification extends AuthEvent {
//   const AuthEventSendEmailVerification();
// }

// class AuthEventSendPasswordReset extends AuthEvent {
//   final String toEmail;

//   const AuthEventSendPasswordReset({
//     required this.toEmail,
//   });
// }

// class AuthEventGetCurrentUser extends AuthEvent {
//   const AuthEventGetCurrentUser();
// }
