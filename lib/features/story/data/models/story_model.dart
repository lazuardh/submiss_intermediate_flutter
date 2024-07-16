import 'dart:convert';

class StoryResponse {
  final bool error;
  final String message;
  final List<Story> list;

  StoryResponse({
    required this.error,
    required this.message,
    required this.list,
  });

  factory StoryResponse.fromJson(String str) =>
      StoryResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StoryResponse.fromMap(Map<String, dynamic> json) => StoryResponse(
        error: json["error"],
        message: json["message"],
        list: List<Story>.from(json["listStory"].map((x) => Story.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
        "listStory": List<dynamic>.from(list.map((x) => x.toMap())),
      };
}

class Story {
  final String id;
  final String name;
  final String description;
  final String photoUrl;
  final DateTime createdAt;
  final double? lat;
  final double? lon;

  Story({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.createdAt,
    required this.lat,
    required this.lon,
  });

  factory Story.fromJson(String str) => Story.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Story.fromMap(Map<String, dynamic> json) => Story(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        photoUrl: json["photoUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        lat: json["lat"]?.toDouble() ?? null,
        lon: json["lon"]?.toDouble() ?? null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "photoUrl": photoUrl,
        "createdAt": createdAt.toIso8601String(),
        "lat": lat,
        "lon": lon,
      };
}
