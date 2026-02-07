import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:instagram_clone/data/data_source/post_data_source.dart';
import 'package:instagram_clone/data/data_source/story_data_source.dart';
import 'package:instagram_clone/data/repository/pos_repository.dart';
import 'package:instagram_clone/data/repository/story_repository.dart';

var locator = GetIt.instance;

setUp() {
  locator.registerSingleton<Dio>(Dio());

  //data sources
  locator.registerFactory<IPostDataSource>(() => PostDataSource(locator()));
  locator.registerFactory<IStoryDataSource>(() => StoryDataSource(locator()));

  //repository
  locator.registerFactory<IPostRepository>(() => PostRepository(locator()));
  locator.registerFactory<IStoryRepository>(() => StoryRepository(locator()));
}
