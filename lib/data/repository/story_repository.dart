import 'package:instagram_clone/data/data_source/story_data_source.dart';
import 'package:instagram_clone/data/models/stories.dart';
import 'package:instagram_clone/utils/error_handling/app_exception.dart';
import 'package:instagram_clone/utils/error_handling/check_exceptions.dart';
import 'package:instagram_clone/utils/resources/data_state.dart';

abstract class IStoryRepository {
  Future<DataState<List<StoryModel>>> fetchStories();
}

class StoryRepository extends IStoryRepository {
  final IStoryDataSource dataSource;

  StoryRepository(this.dataSource);
  @override
  Future<DataState<List<StoryModel>>> fetchStories() async {
    try {
      final storyList = await dataSource.fetchStories();
      return DataSuccess(storyList);
    } on AppException catch (e) {
      return CheckExceptions.getError(e);
    }
  }
}
