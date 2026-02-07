import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/models/stories.dart';
import 'package:instagram_clone/widgets/instagram_story_swipe.dart';
import 'package:instagram_clone/widgets/story_viewer.dart';
import 'package:shimmer/shimmer.dart';

class Story extends StatefulWidget {
  const Story(
      {super.key,
      required this.storyModel,
      required this.index,
      required this.storyList});
  final StoryModel storyModel;
  final int index;
  final List<StoryModel> storyList;

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> with TickerProviderStateMixin {
  late Animation<double> gap;
  late Animation<double> base;
  late Animation<double> reverse;
  late AnimationController controller;

  bool isAnimating = false;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                isAnimating = false;
              });
            }
          });
    base = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    reverse = Tween<double>(begin: 0.0, end: -1.0).animate(base);
    gap = Tween<double>(begin: 8.0, end: 0.0).animate(base)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          isAnimating = true;
        });
        controller.reset();
        controller.forward();
        Future.delayed(Duration(milliseconds: 1500)).then((value) =>
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InstagramStorySwipe(
                    initialPage: widget.index,
                    children: List.generate(widget.storyList.length, (index) {
                      var story = widget.storyList[index];
                      return StoryViewer(
                        storyModel: story,
                        index: index,
                        storyList: widget.storyList,
                        onStoryCompleted: (bool value) {
                          // story.isCompleted = value;
                        },
                      );
                    })),
              ),
            ).then((_) {
              if (widget.storyModel.isCompleted!) {
                setState(() {
                  widget.storyModel.isCompleted = true;
                });
              }
            }));
      },
      child: Column(
        crossAxisAlignment: widget.storyModel.username!.length <= 11
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Container(
            height: 64,
            width: 64,
            margin: EdgeInsets.only(right: 20, top: 1),
            child: RotationTransition(
              turns: isAnimating ? base : AlwaysStoppedAnimation(0.0),
              child: DashedCircle(
                dashes: 15,
                gapSize: isAnimating ? gap.value : 0,
                color: widget.storyModel.isCompleted!
                    ? Colors.grey
                    : themeData.colorScheme.primary,
                child: RotationTransition(
                  turns: isAnimating ? reverse : AlwaysStoppedAnimation(0.0),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: CachedNetworkImage(
                          imageUrl: widget.storyModel.profilePicUrl!,
                          placeholder: (context, url) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade400,
                              highlightColor: Colors.white,
                              child: Container(
                                height: 64,
                                width: 64,
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                              ),
                            );
                          },
                          useOldImageOnUrlChange: true,
                        )),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.only(right: 13),
            child: Text(
              widget.storyModel.username!.length >= 15
                  ? '${widget.storyModel.username!.substring(0, 10)}...'
                  : widget.storyModel.username!,
              style: themeData.textTheme.caption,
            ),
          )
        ],
      ),
    );
  }
}
