import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(children: [
                _getSearchBox(themeData),
                _getStoryList(themeData)
              ]),
            ),
            SliverPadding(
              padding: EdgeInsets.only(right: 16, left: 16, bottom: 20),
              sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: FittedBox(
                            fit: BoxFit.cover,
                            child:
                                Image.asset('images/explor${index + 1}.png')));
                  }, childCount: 10),
                  gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 3,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 7,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        QuiltedGridTile(2, 1),
                        QuiltedGridTile(2, 2),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                      ])),
            )
          ],
        ),
      ),
    );
  }

  Container _getStoryList(ThemeData themeData) {
    return Container(
      height: 27,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 70,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                  color: Color(0xff272B40),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Text(
                'mahdi',
                style: themeData.textTheme.caption!.copyWith(fontFamily: 'GM'),
              ),
            );
          }),
    );
  }

  Container _getSearchBox(ThemeData themeData) {
    return Container(
      height: 46,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(right: 16, left: 16, top: 12),
      decoration: BoxDecoration(
          color: Color(0xff272B40),
          borderRadius: BorderRadius.all(Radius.circular(13))),
      child: Row(
        children: [
          Image.asset('images/icon_search.png'),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Search ...',
                hintStyle: themeData.textTheme.subtitle2),
          )),
          Image.asset('images/icon_scan.png')
        ],
      ),
    );
  }
}
