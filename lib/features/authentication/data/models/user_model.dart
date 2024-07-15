import 'dart:convert';

class UserResponse {
  bool error;
  String message;
  LoginResult loginResult;

  UserResponse({
    required this.error,
    required this.message,
    required this.loginResult,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        error: json["error"],
        message: json["message"],
        loginResult: LoginResult.fromJson(json["loginResult"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "loginResult": loginResult.toJson(),
      };
}

class LoginResult {
  final String userId;
  final String name;
  final String token;

  LoginResult({
    required this.userId,
    required this.name,
    required this.token,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) => LoginResult(
        userId: json["userId"],
        name: json["name"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "token": token,
      };
}

class User {
  String? email;
  String? password;

  User({
    this.email,
    this.password,
  });

  @override
  String toString() => 'User(email: $email, password: $password)';

  factory User.fromMap(Map<String, dynamic> json) => User(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
      };

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.email == email && other.password == password;
  }

  @override
  int get hashCode => Object.hash(email, password);
}
