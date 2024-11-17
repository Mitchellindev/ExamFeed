class OtpVerificationModel {
  OtpVerificationModel({
    required this.token,
  });

  final String? token;

  factory OtpVerificationModel.fromJson(Map<String, dynamic> json) {
    return OtpVerificationModel(
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
