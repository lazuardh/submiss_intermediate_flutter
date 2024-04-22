import 'dart:convert';

/// todo 2: create a user class to manage a email and password
class UserResult {
  bool error;
  String message;
  User loginResult;

  UserResult({
    required this.error,
    required this.message,
    required this.loginResult,
  });

  factory UserResult.fromMap(Map<String, dynamic> json) => UserResult(
        error: json["error"],
        message: json["message"],
        loginResult: User.fromJson(json["loginResult"]),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
        "loginResult": loginResult.toJson(),
      };

  String toJson() => json.encode(toMap());

  factory UserResult.fromJson(String source) =>
      UserResult.fromMap(json.decode(source));
}

class User {
  String? userId;
  String? name;
  String? email;
  String? password;
  String? token;

  User({
    this.userId,
    this.name,
    this.email,
    this.password,
    this.token,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        userId: json["userId"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "name": name,
        "email": email,
        "password": password,
        "token": token,
      };

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.userId == userId &&
        other.name == name &&
        other.token == token;
  }

  @override
  int get hashCode => Object.hash(userId, name, token);
}
