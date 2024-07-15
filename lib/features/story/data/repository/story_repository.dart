import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../../lib.dart';

class StoryRepository {
  final StoryRemoteDataSource _storyRemoteDataSource;
  final AuthRepository _authRepository;

  StoryRepository(this._storyRemoteDataSource, this._authRepository);

  Future<List<ListStory>> getStories(
      {required int page, required int size}) async {
    final token = await _authRepository.getToken();

    if (token != null) {
      final story = await _storyRemoteDataSource.getAllStory(
        token,
        page: page,
        size: size,
      );
      return story.listStory;
    } else {
      throw Exception("User not logged in");
    }
  }

  Future<DetailStory> getDetailStory(String id) async {
    final token = await _authRepository.getToken();

    if (token != null) {
      final story = await _storyRemoteDataSource.detailStory(token, id);

      return story.detailStory;
    }

    throw Exception('User not logged in');
  }

  Future<UploadResponse> postStory(
    List<int> bytes,
    String filename,
    String description, {
    double? lat,
    double? lon,
  }) async {
    final token = await _authRepository.getToken();

    if (token != null) {
      final addStatus = await _storyRemoteDataSource.uploadStory(
        token,
        bytes,
        filename,
        description,
      );

      print("added story : $addStatus");

      return addStatus;
    }

    throw Exception("error add Story");
  }
}
