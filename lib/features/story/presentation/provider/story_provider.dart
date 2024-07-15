import 'package:flutter/material.dart';
import 'package:submiss_intermediate/features/features.dart';
import '../../../../lib.dart';

class StoryProvider extends ChangeNotifier {
  final StoryRepository _storyRepository;

  StoryProvider(this._storyRepository) {
    _state = StoryState.loading;
    _currentPage = 1;
    getMoreStories();
  }

  late StoryState _state;
  StoryState get state => _state;

  late int _currentPage;

  List<ListStory> _stories = [];
  List<ListStory> get stories => _stories;

  String _message = '';
  String get message => _message;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  bool _hasMoreStories = true;
  bool get hasMoreStories => _hasMoreStories;

  Future<void> getMoreStories() async {
    if (_isLoadingMore || !_hasMoreStories) return;
    _isLoadingMore = true;
    notifyListeners();

    await _fetchStories();

    _isLoadingMore = false;
    notifyListeners();
  }

  Future<void> _fetchStories() async {
    try {
      final response =
          await _storyRepository.getStories(page: _currentPage, size: 5);

      if (_currentPage == 1 && response.isEmpty) {
        _message = 'No stories available';
        _state = StoryState.noData;
      } else {
        if (response.isEmpty) {
          _hasMoreStories = false;
        } else {
          _stories.addAll(response);
          _state = StoryState.hasData;
          _currentPage++;
        }
      }
    } catch (error) {
      print('Error fetching stories: $error');
      _message = 'Error: $error';
      _state = StoryState.error;
    }

    notifyListeners();
  }
}
