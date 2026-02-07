import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:instagram_clone/data/models/posts.dart';
import 'package:instagram_clone/utils/services/media_cache_manager.dart';
import 'package:instagram_clone/widgets/body_post.dart';
import 'package:instagram_clone/widgets/header_post.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PostList extends StatefulWidget {
  const PostList({super.key, required this.postList});
  final List<Post> postList;
  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<VideoPlayerController?> _videoControllers = [];
  bool _isMuted = false;
  @override
  void initState() {
    super.initState();
    _initializeVideoControllers();
  }

  @override
  void dispose() {
    _disposeVideoControllers();
    super.dispose();
  }

  void _initializeVideoControllers() async {
    for (int i = 0; i < widget.postList.length; i++) {
      var post = widget.postList[i];
      if (post.videoVersion!.url!.isNotEmpty) {
        final fileInfo =
            await MediaCacheManager.checkCacheForUrl(post.videoVersion!.url!);
        if (fileInfo == null) {
          var controller = VideoPlayerController.networkUrl(
              Uri.parse(post.videoVersion!.url!));
          controller.setLooping(true);
          _videoControllers.add(controller);
          controller.initialize().then((_) {
            MediaCacheManager.cacheForUrl(post.videoVersion!.url!);
            setState(() {});
          });
        } else {
          final file = fileInfo.file;
          var controller = VideoPlayerController.file(file);
          controller.setLooping(true);
          _videoControllers.add(controller);
          controller.initialize().then((value) {
            setState(() {});
          });
        }
      } else {
        _videoControllers.add(null);
      }
    }
  }

  void _disposeVideoControllers() {
    for (var controller in _videoControllers) {
      controller?.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.postList.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var post = widget.postList[index];
          var videoController = _videoControllers[index];
          return VisibilityDetector(
            key: Key(index.toString()),
            onVisibilityChanged: (info) {
              if (videoController != null) {
                if (info.visibleFraction >= 0.5 &&
                    info.visibleFraction <= 1.0) {
                  if (!post.isVideoPlaying) {
                    videoController.play();
                    setState(() {
                      post.isVideoPlaying = true;
                    });
                  }
                } else {
                  if (post.isVideoPlaying) {
                    videoController.pause();
                    setState(() {
                      post.isVideoPlaying = false;
                    });
                  }
                }
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HeaderPost(post: post),
                SizedBox(
                  height: 24,
                ),
                Stack(
                  children: [
                    BodyPost(
                      post: post,
                      videoPlayerController: videoController,
                    ),
                    Positioned(
                        bottom: post.imageVersion!.height!.toDouble() == 853
                            ? 130
                            : post.imageVersion!.height!.toDouble() == 480
                                ? 100
                                : post.imageVersion!.height!.toDouble() == 600
                                    ? 50
                                    : 100,
                        right: 25,
                        child: (videoController != null && post.isVideoPlaying)
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isMuted = !_isMuted;
                                  });
                                  for (var controller in _videoControllers) {
                                    if (controller != null) {
                                      controller
                                          .setVolume(_isMuted ? 0.0 : 1.0);
                                    }
                                  }
                                },
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black54),
                                    child: Icon(
                                      _isMuted
                                          ? Icons.volume_off
                                          : Icons.volume_up,
                                      size: 20,
                                      color: Colors.white,
                                    )),
                              )
                            : Container()),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
