import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../lib.dart';

part 'response_detail_story.g.dart';
part 'response_detail_story.freezed.dart';

@freezed
class ResponseDetailStory with _$ResponseDetailStory {
  const factory ResponseDetailStory({
    required bool error,
    required String message,
    @JsonKey(name: 'story') required DetailStory detailStory,
  }) = _ResponseDetailStory;

  factory ResponseDetailStory.fromJson(json) =>
      _$ResponseDetailStoryFromJson(json);
}

// class ResponseDetailStory {
//   final bool error;
//   final String message;
//   final DetailStory detailStory;

//   ResponseDetailStory({
//     required this.error,
//     required this.message,
//     required this.detailStory,
//   });

//   factory ResponseDetailStory.fromMap(Map<String, dynamic> json) =>
//       ResponseDetailStory(
//         error: json["error"],
//         message: json["message"],
//         detailStory: DetailStory.fromMap(json['story']),
//       );

//   Map<String, dynamic> toMap() => {
//         "error": error,
//         "message": message,
//         "story": detailStory.toMap(),
//       };
// }

