import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'register_model.g.dart';
part 'register_model.freezed.dart';

@Freezed()
class Register with _$Register {
  const factory Register({
    required String? name,
    required String? email,
    required String? password,
  }) = _Register;

  factory Register.fromJson(json) => _$RegisterFromJson(json);
}

// class Register {
//   String? name;
//   String? email;
//   String? password;

//   Register({
//     required this.name,
//     required this.email,
//     required this.password,
//   });

//   @override
//   String toString() => 'User(email: $email, password: $password)';

//   factory Register.fromMap(Map<String, dynamic> json) => Register(
//         name: json["name"],
//         email: json["email"],
//         password: json["password"],
//       );

//   Map<String, dynamic> toMap() => {
//         "name": name,
//         "email": email,
//         "password": password,
//       };

//   String toJson() => json.encode(toMap());

//   factory Register.fromJson(String source) =>
//       Register.fromMap(jsonDecode(source));
// }
