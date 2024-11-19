import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class SignupResponse {
  const SignupResponse(
      {required this.message,
      required this.id,
      required this.email,
      required this.fullName,
      required this.verified,
      required this.role});

  factory SignupResponse.empty() => SignupResponse(
      message: '', id: '', email: '', fullName: '', verified: false, role: '');

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  @JsonKey(defaultValue: '')
  final String message;
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String fullName;
  @JsonKey(defaultValue: false)
  final bool verified;
  @JsonKey(defaultValue: '')
  final String role;

  @override
  String toString() {
    return 'SignupResponse{message: $message, id: $id, email: $email, fullName: $fullName, verified: $verified, role: $role}';
  }

  SignupResponse copyWith({
    String? message,
    String? id,
    String? email,
    String? fullName,
    bool? verified,
    String? role,
  }) {
    return SignupResponse(
      message: message ?? this.message,
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      verified: verified ?? this.verified,
      role: role ?? this.role,
    );
  }
}
