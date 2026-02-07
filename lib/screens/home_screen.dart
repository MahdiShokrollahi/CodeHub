import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/widgets/post_list_view.dart';
import 'package:instagram_clone/widgets/story_list_view.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Color(0xff1C1F2E)),
        child: SafeArea(
            child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Color(0xff1C1F2E),
              title: Container(
                width: 128,
                height: 24,
                child: Image.asset('images/moodinger_logo.png'),
              ),
              actions: [Image.asset('images/icon_direct.png')],
            ),
            StoryListView(),
          ],
        )),
      ),
    );
  }
}
