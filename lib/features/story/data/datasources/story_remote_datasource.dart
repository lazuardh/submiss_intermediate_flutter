import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../../../../lib.dart';

class StoryRemoteDataSource {
  final http.Client client;

  StoryRemoteDataSource(this.client);

  Future<StoryResponse> getAllStory(
    String token, {
    required int page,
    required int size,
  }) async {
    final response = await http.get(
      Uri.parse('${UrlConstant.stories}?page=$page&size=$size'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print("============== Infinite Scroll page ================");
    print('${UrlConstant.stories}?page=$page&size=$size');

    final message = jsonDecode(response.body);
    print("============== APi ================");
    print(message);

    if (response.statusCode == 200) {
      return StoryResponse.fromJson(jsonDecode(response.body));
    }

    throw Exception(StoryResponse.fromJson(message['message']));
  }

  Future<ResponseDetailStory> detailStory(String token, String id) async {
    final response = await http.get(
      Uri.parse("https://story-api.dicoding.dev/v1//stories/$id"),
      headers: {'Authorization': 'Bearer $token'},
    );

    final message = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ResponseDetailStory.fromJson(data);
    }

    throw Exception(ResponseDetailStory.fromJson(message['mesage']));
  }

  Future<UploadResponse> uploadStory(String token, List<int> bytes,
      String filename, String description, double? lat, double? lon) async {
    final uri = Uri.parse(UrlConstant.stories);
    final request = http.MultipartRequest('POST', uri);

    final multipartFile = http.MultipartFile.fromBytes(
      'photo',
      bytes,
      filename: filename,
    );

    final Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      "Content-type": "multipart/form-data",
    };

    final Map<String, String> fields = {
      'description': description,
      'lat': jsonEncode(lat),
      'lon': jsonEncode(lon),
    };

    request.files.add(multipartFile);
    request.fields.addAll(fields);
    request.headers.addAll(headers);

    final http.StreamedResponse streamedResponse = await request.send();
    final int statusCode = streamedResponse.statusCode;

    final Uint8List responseList = await streamedResponse.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    print("========== API ============");
    print("reason prhase : ${streamedResponse.reasonPhrase}'");
    print(streamedResponse.request);
    print(streamedResponse.statusCode);
    print(streamedResponse.persistentConnection);

    if (statusCode == 201) {
      final Map<String, dynamic> jsonResponse = jsonDecode(responseData);
      final UploadResponse uploadResponse =
          UploadResponse.fromJson(jsonResponse);
      return uploadResponse;
    }

    throw Exception('Upload File Error');
  }
}
