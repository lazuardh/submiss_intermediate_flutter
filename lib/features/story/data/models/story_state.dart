import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../lib.dart';

part 'story_state.freezed.dart';

@freezed
class StoryState with _$StoryState {
  const factory StoryState.initial() = StoryStateInitial;
  const factory StoryState.loading() = StoryStateLoading;
  const factory StoryState.loaded(List<Story> data) = StoryStateLoaded;
  const factory StoryState.error(String message) = StoryStateError;
}
