import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class LoginResponse {
  const LoginResponse(
      {required this.userId,
      required this.accessToken,
      required this.userEmail,
      required this.fullName,
      required this.userVerified,
      required this.userSubscribed,
      required this.acctActive});

  factory LoginResponse.empty() => const LoginResponse(
      userId: '',
      accessToken: '',
      userEmail: '',
      fullName: '',
      userVerified: false,
      userSubscribed: false,
      acctActive: false);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @JsonKey(defaultValue: '')
  final String userId;
  @JsonKey(defaultValue: '')
  final String accessToken;
  @JsonKey(defaultValue: '')
  final String userEmail;
  @JsonKey(defaultValue: '')
  final String fullName;
  @JsonKey(defaultValue: false)
  final bool userVerified;
  @JsonKey(defaultValue: false)
  final bool userSubscribed;
  @JsonKey(defaultValue: false)
  final bool acctActive;

  @override
  String toString() {
    return 'LoginResponse{userId: $userId, accessToken: $accessToken, userEmail: $userEmail, fullName: $fullName, userVerified: $userVerified, userSubscribed: $userSubscribed, acctActive: $acctActive}';
  }

  LoginResponse copyWith({
    String? userId,
    String? accessToken,
    String? userEmail,
    String? fullName,
    bool? userVerified,
    bool? userSubscribed,
    bool? acctActive,
  }) {
    return LoginResponse(
      userId: userId ?? this.userId,
      accessToken: accessToken ?? this.accessToken,
      userEmail: userEmail ?? this.userEmail,
      fullName: fullName ?? this.fullName,
      userVerified: userVerified ?? this.userVerified,
      userSubscribed: userSubscribed ?? this.userSubscribed,
      acctActive: acctActive ?? this.acctActive,
    );
  }
}
