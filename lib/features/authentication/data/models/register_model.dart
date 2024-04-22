class RegisterResult {
  bool error;
  String message;
  Register loginResult;

  RegisterResult({
    required this.error,
    required this.message,
    required this.loginResult,
  });

  factory RegisterResult.fromJson(Map<String, dynamic> json) => RegisterResult(
        error: json["error"],
        message: json["message"],
        loginResult: Register.fromJson(json["loginResult"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "loginResult": loginResult.toJson(),
      };
}

class Register {
  String? name;
  String? email;
  String? password;

  Register({
    required this.name,
    required this.email,
    required this.password,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
