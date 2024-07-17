import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String? email,
    required String? password,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// class User {
//   String? email;
//   String? password;

//   User({
//     this.email,
//     this.password,
//   });

//   @override
//   String toString() => 'User(email: $email, password: $password)';

//   factory User.fromMap(Map<String, dynamic> json) => User(
//         email: json["email"],
//         password: json["password"],
//       );

//   Map<String, dynamic> toMap() => {
//         "email": email,
//         "password": password,
//       };

//   String toJson() => json.encode(toMap());

//   factory User.fromJson(String source) => User.fromMap(json.decode(source));

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is User && other.email == email && other.password == password;
//   }

//   @override
//   int get hashCode => Object.hash(email, password);
// }
