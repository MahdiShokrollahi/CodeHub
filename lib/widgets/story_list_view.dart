import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/blocs/story_bloc/story_bloc.dart';
import 'package:instagram_clone/blocs/story_bloc/story_data_status.dart';
import 'package:instagram_clone/locator.dart';
import 'package:instagram_clone/widgets/add_story.dart';
import 'package:instagram_clone/widgets/story.dart';
import 'package:shimmer/shimmer.dart';

class StoryListView extends StatelessWidget {
  StoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 34),
      sliver: SliverToBoxAdapter(
        child: BlocProvider(
          create: (context) => StoryBloc(locator())..add(LoadStories()),
          child: BlocBuilder<StoryBloc, StoryState>(
            builder: (context, state) {
              if (state.storyDataStatus is StoryDataLoading) {
                return SizedBox(
                  height: 110,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade400,
                        highlightColor: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8, right: 15, top: 1),
                          child: Column(
                            children: [
                              Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 8,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              if (state.storyDataStatus is StoryDataCompleted) {
                StoryDataCompleted storyDataCompleted =
                    state.storyDataStatus as StoryDataCompleted;
                var storyList = storyDataCompleted.StoryList;
                return SizedBox(
                  height: 110,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: storyList.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return AddStory();
                        } else if (index <= storyList.length) {
                          return Story(
                            storyModel: storyList[index - 1],
                            index: index - 1,
                            storyList: storyList,
                          );
                        }
                        return Container();
                      }),
                );
              }
              if (state.storyDataStatus is StoryDataError) {
                StoryDataError storyDataError =
                    state.storyDataStatus as StoryDataError;
                return Text(storyDataError.error);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
