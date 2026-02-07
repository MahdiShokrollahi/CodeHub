import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/models/posts.dart';
import 'package:shimmer/shimmer.dart';

class HeaderPost extends StatelessWidget {
  const HeaderPost({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 44,
            width: 44,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Color(0xff1C1F2E),
                border:
                    Border.all(color: themeData.colorScheme.primary, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: post.profilePicUrl!,
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                        child: Container(),
                        baseColor: Colors.grey.shade400,
                        highlightColor: Colors.white);
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.username!,
                  style:
                      themeData.textTheme.caption!.copyWith(fontFamily: 'GB'),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  post.fullName!.length > 40
                      ? '${post.fullName!.substring(0, 40)}....'
                      : post.fullName!,
                  style:
                      themeData.textTheme.caption!.copyWith(fontFamily: 'GB'),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png')
        ],
      ),
    );
  }
}
