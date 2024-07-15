import 'dart:convert';

class UploadResponse {
  final bool error;
  final String message;

  UploadResponse({
    required this.error,
    required this.message,
  });

  factory UploadResponse.fromMap(Map<String, dynamic> map) {
    return UploadResponse(
      error: map["error"] ?? false,
      message: map["message"] ?? '',
    );
  }

  factory UploadResponse.fromJson(String source) =>
      UploadResponse.fromMap(jsonDecode(source));

  Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
      };
}
