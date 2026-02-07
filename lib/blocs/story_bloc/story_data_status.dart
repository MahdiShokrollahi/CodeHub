import '../../data/models/stories.dart';

abstract class StoryDataStatus {}

class StoryDataLoading extends StoryDataStatus {}

class StoryDataCompleted extends StoryDataStatus {
  final List<StoryModel> StoryList;
  StoryDataCompleted({required this.StoryList});
}

class StoryDataError extends StoryDataStatus {
  final String error;

  StoryDataError({required this.error, s});
}
