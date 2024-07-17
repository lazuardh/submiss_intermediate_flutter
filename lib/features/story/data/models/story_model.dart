import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'story_model.g.dart';
part 'story_model.freezed.dart';

@Freezed()
class Story with _$Story {
  const factory Story({
    required String id,
    required String name,
    required String description,
    required String photoUrl,
    required DateTime createdAt,
    double? lat,
    double? lon,
  }) = _Story;

  factory Story.fromJson(json) => _$StoryFromJson(json);
}

// class Story {
//   final String id;
//   final String name;
//   final String description;
//   final String photoUrl;
//   final DateTime createdAt;
//   final double? lat;
//   final double? lon;

//   Story({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.photoUrl,
//     required this.createdAt,
//     required this.lat,
//     required this.lon,
//   });

//   factory Story.fromJson(String str) => Story.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Story.fromMap(Map<String, dynamic> json) => Story(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         photoUrl: json["photoUrl"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         lat: json["lat"]?.toDouble() ?? null,
//         lon: json["lon"]?.toDouble() ?? null,
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
