import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/models/posts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  const VideoPost({super.key, required this.post});
  final Post post;
  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    if (widget.post.videoVersion!.url!.isNotEmpty) {
      _controller = VideoPlayerController.networkUrl(
          Uri.parse(widget.post.videoVersion!.url!))
        ..initialize().then((value) {
          setState(() {
            _controller.setLooping(true);
            _controller.play();
          });
        });
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : CachedNetworkImage(
            imageUrl: widget.post.imageVersion!.url!,
            placeholder: (context, url) {
              return Shimmer.fromColors(
                  child: Container(
                    height: 400,
                    color: Colors.white,
                  ),
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.white);
            },
          );
  }
}
