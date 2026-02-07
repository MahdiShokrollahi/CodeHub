import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/models/posts.dart';
import 'package:instagram_clone/widgets/image_post.dart';
import 'package:instagram_clone/widgets/share_bottom_sheet.dart';
import 'package:video_player/video_player.dart';

class BodyPost extends StatelessWidget {
  const BodyPost(
      {super.key, required this.post, required this.videoPlayerController});
  final Post post;
  final VideoPlayerController? videoPlayerController;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
          bottom: post.imageVersion!.height!.toDouble() == 421 ? 30 : 0),
      child: AspectRatio(
        aspectRatio:
            post.imageVersion!.width! / (post.imageVersion!.height! + 50),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned(
              top: 0,
              right: 17,
              left: 17,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: (videoPlayerController != null &&
                        videoPlayerController!.value.isInitialized)
                    ? AspectRatio(
                        aspectRatio: videoPlayerController!.value.aspectRatio,
                        child: VideoPlayer(videoPlayerController!))
                    : ImagePost(post: post),
              ),
            ),
            Positioned(
                top: 15,
                right: 30,
                child: (videoPlayerController != null && !post.isVideoPlaying)
                    ? Image.asset('images/icon_video.png')
                    : Container()),
            Positioned(
              bottom: post.imageVersion!.height!.toDouble() == 853
                  ? 70
                  : post.imageVersion!.height!.toDouble() == 480
                      ? 45
                      : post.imageVersion!.height!.toDouble() == 600
                          ? 50
                          : 15,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(255, 255, 255, 0.5),
                          Color.fromRGBO(255, 255, 255, 0.2),
                        ])),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Image.asset('images/icon_hart.png'),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          post.likeCount!.toString(),
                          style: themeData.textTheme.subtitle2,
                        ),
                        Spacer(),
                        Image.asset('images/icon_comments.png'),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          post.commentCount!.toString(),
                          style: themeData.textTheme.subtitle2,
                        ),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Colors.transparent,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: DraggableScrollableSheet(
                                        initialChildSize: 0.4,
                                        minChildSize: 0.2,
                                        maxChildSize: 0.7,
                                        builder: (context, scrollController) =>
                                            ShareBottomSheet(),
                                      ),
                                    );
                                  });
                            },
                            child: Image.asset('images/icon_share.png')),
                        Spacer(),
                        Image.asset('images/icon_save.png'),
                        SizedBox(
                          width: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
