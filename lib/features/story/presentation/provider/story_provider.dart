import 'package:flutter/material.dart';
import 'package:submiss_intermediate/features/features.dart';
import '../../../../lib.dart';

class StoryProvider extends ChangeNotifier {
  final StoryRepository _storyRepository;

  StoryProvider(this._storyRepository);

  int? pageItems = 1;
  int limit = 5;

  // List<Story> stories = [];

  StoryState _state = const StoryState.initial();
  StoryState get state => _state;

  String _message = '';
  String get message => _message;

  Future<void> refreshStories() async {
    try {
      _state = const StoryState.loading();
      notifyListeners();

      final response = await _storyRepository.getStories(1, limit);
      // stories = response;
      pageItems = 1;

      _state = StoryState.loaded(response);
      notifyListeners();
    } catch (e) {
      _state = const StoryState.error('Failed to Load Data');
      print('$e');
      notifyListeners();
    }
  }

  Future<void> fetchStories() async {
    try {
      if (pageItems == 1) {
        _state = const StoryState.loading();
        notifyListeners();
      }

      final response = await _storyRepository.getStories(pageItems!, limit);

      if (response.length < limit) {
        pageItems = null;
      } else {
        pageItems = pageItems! + 1;
      }

      // stories.addAll(response);
      _state = StoryState.loaded(response);

      notifyListeners();
    } catch (e) {
      _state = const StoryState.error("failed to load data");
      _message = '$e';
      print("========= Provider =============");
      print(_message);
      notifyListeners();
    }
  }
}
