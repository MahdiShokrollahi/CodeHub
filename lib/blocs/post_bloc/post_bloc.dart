import 'package:bloc/bloc.dart';
import 'package:instagram_clone/data/models/posts.dart';
import 'package:instagram_clone/data/repository/pos_repository.dart';
import 'package:instagram_clone/utils/resources/data_state.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final IPostRepository repository;
  PostBloc(this.repository) : super(PostLoading()) {
    on<LoadPosts>((event, emit) async {
      emit(PostLoading());

      final dataState = await repository.fetchPosts();

      if (dataState is DataSuccess) {
        emit(PostCompleted(postList: dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(PostError(error: dataState.error!));
      }
    });
  }
}
