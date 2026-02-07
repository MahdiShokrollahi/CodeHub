import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/blocs/post_bloc/post_bloc.dart';
import 'package:instagram_clone/locator.dart';
import 'package:instagram_clone/widgets/post_list.dart';
import 'package:instagram_clone/widgets/shimmer_post_loading.dart';

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (context) {
          final bloc = PostBloc(locator());
          bloc.add(LoadPosts());
          return bloc;
        },
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return ShimmerPostLoading();
            }
            if (state is PostCompleted) {
              final postList = state.postList;
              return PostList(
                postList: postList,
              );
            }
            if (state is PostError) {
              return Center(
                child: Text(state.error),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
