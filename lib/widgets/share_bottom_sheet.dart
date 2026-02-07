import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/grid_content.dart';

class ShareBottomSheet extends StatelessWidget {
  ShareBottomSheet({
    Key? key,
  }) : super(key: key);
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.09),
            ),
            child: GrideContent(controller: controller)),
      ),
    );
  }
}
