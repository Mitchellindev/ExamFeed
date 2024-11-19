// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      userId: json['user_id'] as String? ?? '',
      accessToken: json['access_token'] as String? ?? '',
      userEmail: json['user_email'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      userVerified: json['user_verified'] as bool? ?? false,
      userSubscribed: json['user_subscribed'] as bool? ?? false,
      acctActive: json['acct_active'] as bool? ?? false,
    );
