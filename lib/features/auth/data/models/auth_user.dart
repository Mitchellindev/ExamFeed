class AuthUser {
  AuthUser({
    required this.userId,
    required this.accessToken,
    required this.userEmail,
    required this.fullName,
    required this.userVerified,
    required this.userSubscribed,
    required this.acctActive,
    required this.image,
  });

  final String? userId;
  final String? accessToken;
  final String? userEmail;
  final String? fullName;
  final bool? userVerified;
  final bool? userSubscribed;
  final bool? acctActive;
  final String? image;

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      userId: json["userId"],
      accessToken: json["accessToken"],
      userEmail: json["userEmail"],
      fullName: json["fullName"],
      userVerified: json["userVerified"],
      userSubscribed: json["userSubscribed"],
      acctActive: json["acctActive"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "accessToken": accessToken,
        "userEmail": userEmail,
        "fullName": fullName,
        "userVerified": userVerified,
        "userSubscribed": userSubscribed,
        "acctActive": acctActive,
        "image": image,
      };
}
