import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'upload_response.g.dart';
part 'upload_response.freezed.dart';

@freezed
class UploadResponse with _$UploadResponse {
  const factory UploadResponse({
    required bool error,
    required String message,
  }) = _UploadResponse;

  factory UploadResponse.fromJson(json) => _$UploadResponseFromJson(json);
}

// class UploadResponse {
//   final bool error;
//   final String message;

//   UploadResponse({
//     required this.error,
//     required this.message,
//   });

//   factory UploadResponse.fromMap(Map<String, dynamic> map) {
//     return UploadResponse(
//       error: map["error"] ?? false,
//       message: map["message"] ?? '',
//     );
//   }

//   factory UploadResponse.fromJson(String source) =>
//       UploadResponse.fromMap(jsonDecode(source));

//   Map<String, dynamic> toMap() => {
//         "error": error,
//         "message": message,
//       };
// }

