import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_result.g.dart';
part 'login_result.freezed.dart';

@Freezed()
class LoginResult with _$LoginResult {
  const factory LoginResult({
    required String userId,
    required String name,
    required String token,
  }) = _LoginResult;

  factory LoginResult.fromJson(json) => _$LoginResultFromJson(json);
}

// class LoginResult {
//   final String userId;
//   final String name;
//   final String token;

//   LoginResult({
//     required this.userId,
//     required this.name,
//     required this.token,
//   });

//   factory LoginResult.fromJson(Map<String, dynamic> json) => LoginResult(
//         userId: json["userId"],
//         name: json["name"],
//         token: json["token"],
//       );

//   Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "name": name,
//         "token": token,
//       };
// }
