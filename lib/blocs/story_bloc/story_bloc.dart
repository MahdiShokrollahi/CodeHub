import 'package:bloc/bloc.dart';
import 'package:instagram_clone/blocs/story_bloc/story_data_status.dart';
import 'package:instagram_clone/data/repository/story_repository.dart';
import 'package:instagram_clone/utils/resources/data_state.dart';
import 'package:meta/meta.dart';

part 'story_event.dart';
part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final IStoryRepository repository;
  StoryBloc(this.repository)
      : super(StoryState(
            storyDataStatus: StoryDataLoading(), isCompleted: false)) {
    on<LoadStories>((event, emit) async {
      emit(state.copyWith(newStoryDataStatus: StoryDataLoading()));

      final dataState = await repository.fetchStories();

      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newStoryDataStatus:
                StoryDataCompleted(StoryList: dataState.data!)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(
            newStoryDataStatus: StoryDataError(error: dataState.error!)));
      }
    });

    on<StoryChanged>((event, emit) {
      emit(state.copyWith(newIsCompleted: true));
    });
  }
}
