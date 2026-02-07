// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'story_bloc.dart';

class StoryState {
  StoryDataStatus storyDataStatus;
  bool isCompleted;
  StoryState({
    required this.storyDataStatus,
    required this.isCompleted,
  });

  StoryState copyWith({
    StoryDataStatus? newStoryDataStatus,
    bool? newIsCompleted,
  }) {
    return StoryState(
      storyDataStatus: newStoryDataStatus ?? storyDataStatus,
      isCompleted: newIsCompleted ?? isCompleted,
    );
  }
}
