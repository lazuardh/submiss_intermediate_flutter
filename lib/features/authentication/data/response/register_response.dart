import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';
part 'register_response.freezed.dart';

@freezed
class ResponseRegister with _$ResponseRegister {
  const factory ResponseRegister({
    required String error,
    required String? message,
  }) = _ResponseRegister;

  factory ResponseRegister.fromJson(json) => _$ResponseRegisterFromJson(json);
}

// class ResponseRegister {
//   bool error;
//   String? message;

//   ResponseRegister({
//     required this.error,
//     required this.message,
//   });

//   @override
//   String toString() => 'RegisterResponse (error: $error, message: $message)';

//   factory ResponseRegister.fromMap(Map<String, dynamic> map) =>
//       ResponseRegister(error: map['error'], message: map['message']);

//   Map<String, dynamic> toMap() => {
//         'error': error,
//         'message': message,
//       };

//   String toJson() => json.encode(toMap());

//   factory ResponseRegister.fromJson(String source) =>
//       ResponseRegister.fromMap(jsonDecode(source));
// }

