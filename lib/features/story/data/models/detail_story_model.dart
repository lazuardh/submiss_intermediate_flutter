class DetailStory {
  final String id;
  final String name;
  final String description;
  final String photoUrl;
  final DateTime createdAt;
  final double? lat;
  final double? lon;

  DetailStory({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.createdAt,
    this.lat,
    this.lon,
  });

  factory DetailStory.fromMap(Map<String, dynamic> json) => DetailStory(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        photoUrl: json["photoUrl"] ?? '',
        createdAt: DateTime.parse(json["createdAt"]),
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
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

class ResponseDetailStory {
  final bool error;
  final String message;
  final DetailStory detailStory;

  ResponseDetailStory({
    required this.error,
    required this.message,
    required this.detailStory,
  });

  factory ResponseDetailStory.fromMap(Map<String, dynamic> json) =>
      ResponseDetailStory(
        error: json["error"],
        message: json["message"],
        detailStory: DetailStory.fromMap(json['story']),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
        "story": detailStory.toMap(),
      };
}
