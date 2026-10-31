class Loginresponse {
  final String access_token;
  final String? refreshToken;

  Loginresponse({required this.access_token, this.refreshToken});

  factory Loginresponse.fromJson(Map<String, dynamic> json) {
    return Loginresponse(access_token: json["access_token"]);
  }
}
