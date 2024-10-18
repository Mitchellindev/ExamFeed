class AuthRegisterUser {
  AuthRegisterUser({
    required this.message,
    required this.id,
    required this.email,
    required this.fullName,
    required this.verified,
    required this.role,
  });

  final String? message;
  final String? id;
  final String? email;
  final String? fullName;
  final bool? verified;
  final String? role;

  factory AuthRegisterUser.fromJson(Map<String, dynamic> json) {
    return AuthRegisterUser(
      message: json["message"],
      id: json["id"],
      email: json["email"],
      fullName: json["fullName"],
      verified: json["verified"],
      role: json["role"],
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "id": id,
        "email": email,
        "fullName": fullName,
        "verified": verified,
        "role": role,
      };
}
