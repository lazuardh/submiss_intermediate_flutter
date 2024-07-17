import 'package:flutter/material.dart';
import '../../../../lib.dart';

class DetailStoryProvider extends ChangeNotifier {
  final StoryRepository _storyRepository;
  String id = '';

  DetailStoryProvider(this._storyRepository, {this.id = ''}) {
    _fetchDetailStory(id);
  }

  late DetailStory _detailStory;
  DetailStory get detailStory => _detailStory;

  DetailStoryState _state = const DetailStoryState.initial();
  DetailStoryState get state => _state;

  String _message = '';
  String get message => _message;

  Future<void> _fetchDetailStory(id) async {
    try {
      _state = const DetailStoryState.loading();
      notifyListeners();

      final response = await _storyRepository.getDetailStory(id);

      _detailStory = response;
      _state = DetailStoryState.loaded(response);
      notifyListeners();
    } catch (error) {
      _message = 'Error: $error';
      _state = const DetailStoryState.error();
      notifyListeners();
      print('Error fetching detail story: $error');
    }
  }
}
