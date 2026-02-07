import 'package:instagram_clone/data/data_source/post_data_source.dart';
import 'package:instagram_clone/data/models/posts.dart';
import 'package:instagram_clone/utils/error_handling/app_exception.dart';
import 'package:instagram_clone/utils/error_handling/check_exceptions.dart';
import 'package:instagram_clone/utils/resources/data_state.dart';

abstract class IPostRepository {
  Future<DataState<List<Post>>> fetchPosts();
}

class PostRepository extends IPostRepository {
  final IPostDataSource dataSource;

  PostRepository(this.dataSource);
  @override
  Future<DataState<List<Post>>> fetchPosts() async {
    try {
      final postList = await dataSource.fetchPosts();
      return DataSuccess(postList);
    } on AppException catch (e) {
      return CheckExceptions.getError(e);
    }
  }
}
