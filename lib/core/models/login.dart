class LoginResponse {
  String? userId;
  String? accessToken;
  String? userEmail;
  String? fullName;
  bool? userVerified;
  bool? userSubscribed;
  bool? acctActive;

  LoginResponse(
      {this.userId,
      this.accessToken,
      this.userEmail,
      this.fullName,
      this.userVerified,
      this.userSubscribed,
      this.acctActive});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    accessToken = json['accessToken'];
    userEmail = json['userEmail'];
    fullName = json['fullName'];
    userVerified = json['userVerified'];
    userSubscribed = json['userSubscribed'];
    acctActive = json['acctActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['accessToken'] = this.accessToken;
    data['userEmail'] = this.userEmail;
    data['fullName'] = this.fullName;
    data['userVerified'] = this.userVerified;
    data['userSubscribed'] = this.userSubscribed;
    data['acctActive'] = this.acctActive;
    return data;
  }
}
