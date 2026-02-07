part of 'story_bloc.dart';

@immutable
abstract class StoryEvent {}

class LoadStories extends StoryEvent {}

class StoryChanged extends StoryEvent {}
