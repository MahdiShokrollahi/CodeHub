// import 'package:flutter/material.dart';
// import 'package:story_view/controller/story_controller.dart';
// import 'package:story_view/widgets/story_view.dart';

// class StoryPageView extends StatefulWidget {
//   StoryPageView({super.key});

//   @override
//   State<StoryPageView> createState() => _StoryPageViewState();
// }

// class _StoryPageViewState extends State<StoryPageView> {
//   final StoryController storyController = StoryController();
//   List<StoryItem> storyItems = [];
//   @override
//   void initState() {
//     storyItems = [
//       StoryItem.pageImage(
//           url: 'https://shokor.storage.iran.liara.space/image_post/mega.jpg',
//           controller: storyController),
//       StoryItem.pageVideo(
//           'https://shokor.storage.iran.liara.space/vdieo_post/air.mp4',
//           controller: storyController),
//       StoryItem.pageImage(
//           url: 'https://shokor.storage.iran.liara.space/image_post/plant.jpg',
//           controller: storyController),
//     ];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: StoryView(
//         storyItems: storyItems,
//         controller: storyController,
//         inline: false,
//       ),
//     );
//   }
// }
