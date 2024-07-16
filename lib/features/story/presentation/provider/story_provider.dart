import 'package:flutter/material.dart';
import 'package:submiss_intermediate/features/features.dart';
import '../../../../lib.dart';

class StoryProvider extends ChangeNotifier {
  final StoryRepository _storyRepository;

  StoryProvider(this._storyRepository);

  int? pageItems = 1;
  int limit = 5;
  bool storyError = false;

  List<Story> stories = [];

  StoryState _state = StoryState.initial;
  StoryState get state => _state;

  String _message = '';
  String get message => _message;

  Future<void> refreshStories() async {
    try {
      _state = StoryState.loading;
      notifyListeners();

      final response = await _storyRepository.getStories(1, limit);
      stories = response;
      pageItems = 2;
      _message = "Refreshing Story Success";
      storyError = false;
      _state = StoryState.loaded;
      notifyListeners();
    } catch (e) {
      _state = StoryState.error;
      storyError = true;
      _message = '$e';
      notifyListeners();
    }
  }

  Future<void> fetchStories() async {
    try {
      if (pageItems == 1) {
        _state = StoryState.loading;
        notifyListeners();
      }

      final response = await _storyRepository.getStories(pageItems!, limit);

      if (response.length < limit) {
        pageItems = null;
      } else {
        pageItems = pageItems! + 1;
      }

      stories.addAll(response);

      _message = "Fetching Story Success";
      storyError = false;
      _state = StoryState.loaded;
      notifyListeners();
    } catch (e) {
      _state = StoryState.error;
      storyError = true;
      _message = '$e';
      notifyListeners();
    }
  }
}
