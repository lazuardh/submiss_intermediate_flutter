import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../.././../lib.dart';

part 'user_response.g.dart';
part 'user_response.freezed.dart';

@Freezed()
class UserResponse with _$UserResponse {
  const factory UserResponse({
    required bool error,
    required String message,
    @JsonKey(name: 'loginResult') required LoginResult loginResult,
  }) = _UserResponse;

  factory UserResponse.fromJson(json) => _$UserResponseFromJson(json);
}

// class UserResponse {
//   bool error;
//   String message;
//   LoginResult loginResult;

//   UserResponse({
//     required this.error,
//     required this.message,
//     required this.loginResult,
//   });

//   factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
//         error: json["error"],
//         message: json["message"],
//         loginResult: LoginResult.fromJson(json["loginResult"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "error": error,
//         "message": message,
//         "loginResult": loginResult.toJson(),
//       };
// }

