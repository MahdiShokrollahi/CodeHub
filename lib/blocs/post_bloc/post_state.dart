part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostLoading extends PostState {}

class PostCompleted extends PostState {
  final List<Post> postList;
  PostCompleted({required this.postList});
}

class PostError extends PostState {
  final String error;

  PostError({required this.error});
}
