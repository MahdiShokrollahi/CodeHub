import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/models/stories.dart';
import 'package:instagram_clone/widgets/instagram_story_swipe.dart';
import 'package:shimmer/shimmer.dart';
import 'package:story_view/story_view.dart';

class StoryViewer extends StatefulWidget {
  StoryViewer({
    super.key,
    required this.storyModel,
    required this.index,
    required this.storyList,
    required this.onStoryCompleted,
  });

  final List<StoryModel> storyList;
  final void Function(bool value) onStoryCompleted;
  final StoryModel storyModel;
  final int index;

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  final StoryController storyController = StoryController();
  @override
  Widget build(BuildContext context) {
    final List<StoryItem> storyList =
        List.generate(widget.storyModel.medias!.length, (index) {
      var media = widget.storyModel.medias![index];
      return media.type == 'image'
          ? StoryItem.pageImage(
              url: media.url!,
              controller: storyController,
              imageFit: BoxFit.cover)
          : StoryItem.pageVideo(media.url!, controller: storyController);
    });
    return Scaffold(
        body: Stack(
      children: [
        StoryView(
          storyItems: storyList,
          controller: storyController,
          onComplete: () {
            for (var story in widget.storyList) {
              if (story == widget.storyModel) {
                setState(() {
                  story.isCompleted = true;
                });
              }
            }

            if (widget.index == widget.storyList.length - 1) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InstagramStorySwipe(
                          initialPage: widget.index + 1,
                          children:
                              List.generate(widget.storyList.length, (index) {
                            var story = widget.storyList[index];
                            return StoryViewer(
                              storyModel: story,
                              index: index,
                              storyList: widget.storyList,
                              onStoryCompleted: (bool value) {},
                            );
                          }))));
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80, left: 15, right: 10),
          child: Row(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    imageUrl: widget.storyModel.profilePicUrl!,
                    placeholder: (context, url) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade400,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                        ),
                      );
                    },
                    useOldImageOnUrlChange: true,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.storyModel.username!,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
