class LoginResponse {
  LoginResponse({
    this.data,
    this.message,
    this.errorList,
  });

  LoginData? data;
  String? message;
  List<String>? errorList;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        data: LoginData.fromJson(json["Data"]),
        message: json["Message"],
        errorList: List<String>.from(json["ErrorList"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Data": data!.toJson(),
        "Message": message,
        "ErrorList": List<dynamic>.from(errorList!.map((x) => x)),
      };
}

class LoginData {
  LoginData({
    this.email,
    this.password,
    this.rememberMe,
    this.displayCaptcha,
  });

  String? email;
  String? password;
  bool? rememberMe;
  bool? displayCaptcha;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        email: json["Email"],
        password: json["Password"],
        rememberMe: json["RememberMe"],
        displayCaptcha: json["DisplayCaptcha"],
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
        "Password": password,
        "RememberMe": rememberMe,
        "DisplayCaptcha": displayCaptcha,
      };
}
