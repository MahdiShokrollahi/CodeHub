import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class InstagramStorySwipe extends StatefulWidget {
  final List<Widget> children;
  final int initialPage;

  InstagramStorySwipe({
    required this.children,
    this.initialPage = 0,
  }) : assert(children.isNotEmpty);

  @override
  _InstagramStorySwipeState createState() => _InstagramStorySwipeState();
}

class _InstagramStorySwipeState extends State<InstagramStorySwipe> {
  late PageController _pageController;
  double currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.children.length,
      itemBuilder: (context, index) {
        final double value = _pageController.position.haveDimensions
            ? _pageController.page!
            : index.toDouble();
        return _SwipeWidget(
          index: index,
          pageNotifier: value,
          child: widget.children[index],
        );
      },
    );
  }
}

double degToRad(double deg) => deg * (pi / 180.0);

class _SwipeWidget extends StatelessWidget {
  final int index;
  final double pageNotifier;
  final Widget child;

  const _SwipeWidget({
    required this.index,
    required this.pageNotifier,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLeaving = (index - pageNotifier) <= 0;
    final t = (index - pageNotifier);
    final rotationY = lerpDouble(0, 90, t)!;
    final opacity = lerpDouble(0, 1, t.abs())!.clamp(0.0, 1.0);
    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(-degToRad(rotationY));
    return Transform(
      alignment: isLeaving ? Alignment.centerRight : Alignment.centerLeft,
      transform: transform,
      child: Stack(
        children: [
          child,
          Positioned.fill(
            child: Opacity(
              opacity: opacity,
              child: SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
