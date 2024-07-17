import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../lib.dart';
part 'story_response.g.dart';
part 'story_response.freezed.dart';

@freezed
class StoryResponse with _$StoryResponse {
  const factory StoryResponse({
    required bool error,
    required String message,
    @JsonKey(name: 'listStory') required List<Story> list,
  }) = _StoryResponse;

  factory StoryResponse.fromJson(json) => _$StoryResponseFromJson(json);
}

// class StoryResponse {
//   final bool error;
//   final String message;
//   final List<Story> list;

//   StoryResponse({
//     required this.error,
//     required this.message,
//     required this.list,
//   });

//   factory StoryResponse.fromJson(String str) =>
//       StoryResponse.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory StoryResponse.fromMap(Map<String, dynamic> json) => StoryResponse(
//         error: json["error"],
//         message: json["message"],
//         list: List<Story>.from(json["listStory"].map((x) => Story.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "error": error,
//         "message": message,
//         "listStory": List<dynamic>.from(list.map((x) => x.toMap())),
//       };
// }
