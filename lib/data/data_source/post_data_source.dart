import 'package:dio/dio.dart';
import 'package:instagram_clone/data/models/posts.dart';
import 'package:instagram_clone/utils/error_handling/check_exceptions.dart';

abstract class IPostDataSource {
  Future<List<Post>> fetchPosts();
}

class PostDataSource extends IPostDataSource {
  final Dio _dio;

  PostDataSource(this._dio);
  @override
  Future<List<Post>> fetchPosts() async {
    try {
      var response = await _dio
          .get('https://mocki.io/v1/314a703c-5649-45ba-9a26-82c87bd56823');
      final postsModel = Posts.fromJson(response.data);
      return postsModel.data!.posts!;
    } on DioException catch (e) {
      return CheckExceptions.response(e.response!);
    }
  }
}
