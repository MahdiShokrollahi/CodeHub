import 'package:dio/dio.dart';
import 'package:instagram_clone/data/models/stories.dart';
import 'package:instagram_clone/utils/error_handling/check_exceptions.dart';

abstract class IStoryDataSource {
  Future<List<StoryModel>> fetchStories();
}

class StoryDataSource extends IStoryDataSource {
  final Dio _dio;

  StoryDataSource(this._dio);
  @override
  Future<List<StoryModel>> fetchStories() async {
    try {
      var response = await _dio
          .get('https://mocki.io/v1/44674b06-c7ab-446b-b685-651b13dde72c');
      final storyModel = Stories.fromJson(response.data);
      return storyModel.stories!;
    } on DioException catch (e) {
      return CheckExceptions.response(e.response!);
    }
  }
}
