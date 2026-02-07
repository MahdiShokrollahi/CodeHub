import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/models/posts.dart';
import 'package:shimmer/shimmer.dart';

class ImagePost extends StatelessWidget {
  const ImagePost({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: post.imageVersion!.url!,
      placeholder: (context, url) {
        return Shimmer.fromColors(
            child: Container(
              height: post.imageVersion!.height!.toDouble(),
              width: post.imageVersion!.width!.toDouble(),
              color: Colors.white,
            ),
            baseColor: Colors.grey.shade400,
            highlightColor: Colors.white);
      },
    );
  }
}
