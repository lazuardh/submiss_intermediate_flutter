import 'package:flutter/material.dart';
import '../../../../lib.dart';

class DetailStoryProvider extends ChangeNotifier {
  final StoryRepository _storyRepository;
  String id = '';

  DetailStoryProvider(this._storyRepository, {this.id = ''}) {
    _state = StoryState.loading;
    _fetchDetailStory(id);
  }

  late DetailStory _detailStory;
  DetailStory get detailStory => _detailStory;

  late StoryState _state;
  StoryState get state => _state;

  String _message = '';
  String get message => _message;

  Future<void> _fetchDetailStory(id) async {
    try {
      _state = StoryState.loading;
      notifyListeners();

      final response = await _storyRepository.getDetailStory(id);
      print("============ id Me ==================");
      print("id user: $id");

      print("============ Response Detail Story ==================");
      print(response);

      _detailStory = response;
      _state = StoryState.loaded;
      notifyListeners();
    } catch (error) {
      _message = 'Error: $error';
      _state = StoryState.error;
      notifyListeners();
      print('Error fetching detail story: $error');
    }
  }
}
