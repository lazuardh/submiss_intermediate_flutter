import 'dart:convert';

class ResponseRegister {
  bool error;
  String? message;

  ResponseRegister({
    required this.error,
    required this.message,
  });

  @override
  String toString() => 'RegisterResponse (error: $error, message: $message)';

  factory ResponseRegister.fromMap(Map<String, dynamic> map) =>
      ResponseRegister(error: map['error'], message: map['message']);

  Map<String, dynamic> toMap() => {
        'error': error,
        'message': message,
      };

  String toJson() => json.encode(toMap());

  factory ResponseRegister.fromJson(String source) =>
      ResponseRegister.fromMap(jsonDecode(source));
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

  @override
  String toString() => 'User(email: $email, password: $password)';

  factory Register.fromMap(Map<String, dynamic> json) => Register(
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "password": password,
      };

  String toJson() => json.encode(toMap());

  factory Register.fromJson(String source) =>
      Register.fromMap(jsonDecode(source));
}
