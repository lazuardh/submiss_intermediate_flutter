import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'detail_story_model.g.dart';
part 'detail_story_model.freezed.dart';

@Freezed()
class DetailStory with _$DetailStory {
  const factory DetailStory({
    required String id,
    required String name,
    required String description,
    required String photoUrl,
    required DateTime createdAt,
    double? lat,
    double? lon,
  }) = _DetailStory;

  factory DetailStory.fromJson(json) => _$DetailStoryFromJson(json);
}

// class DetailStory {
//   final String id;
//   final String name;
//   final String description;
//   final String photoUrl;
//   final DateTime createdAt;
//   final double? lat;
//   final double? lon;

//   DetailStory({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.photoUrl,
//     required this.createdAt,
//     this.lat,
//     this.lon,
//   });

//   factory DetailStory.fromMap(Map<String, dynamic> json) => DetailStory(
//         id: json["id"] ?? '',
//         name: json["name"] ?? '',
//         description: json["description"] ?? '',
//         photoUrl: json["photoUrl"] ?? '',
//         createdAt: DateTime.parse(json["createdAt"]),
//         lat: json["lat"]?.toDouble(),
//         lon: json["lon"]?.toDouble(),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "photoUrl": photoUrl,
//         "createdAt": createdAt.toIso8601String(),
//         "lat": lat,
//         "lon": lon,
//       };
// }
