import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../lib.dart';

part 'detail_story_state.freezed.dart';

@freezed
class DetailStoryState with _$DetailStoryState {
  const factory DetailStoryState.initial() = DetailStoryStateInitial;
  const factory DetailStoryState.loading() = DetailStoryStateLoading;
  const factory DetailStoryState.loaded(DetailStory data) =
      DetailStoryStateLoaded;
  const factory DetailStoryState.error() = DetailStoryStateError;
}
