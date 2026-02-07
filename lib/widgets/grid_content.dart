import 'package:flutter/material.dart';

class GrideContent extends StatelessWidget {
  const GrideContent({super.key, required this.controller});
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 67,
                    margin: EdgeInsets.only(top: 10, bottom: 22),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Share',
                          style: themeData.textTheme.subtitle2!
                              .copyWith(fontSize: 20)),
                      Image.asset('images/icon_share_bottomsheet.png'),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    height: 46,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.only(bottom: 32),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.4),
                        borderRadius: BorderRadius.all(Radius.circular(13))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('images/icon_search.png'),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Search User',
                                hintStyle: themeData.textTheme.subtitle2!,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return getItemGrid(themeData);
                  },
                  childCount: 40,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 110)),
            SliverPadding(padding: EdgeInsets.only(top: 100))
          ],
        ),
        Positioned(
          bottom: 47,
          child: ElevatedButton(
              style: themeData.elevatedButtonTheme.style,
              onPressed: () {},
              child: Text(
                'Send',
                style: themeData.textTheme.button,
              )),
        )
      ],
    );
  }

  Widget getItemGrid(ThemeData themeData) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('images/profile.png')),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Mahdi',
          style: themeData.textTheme.caption!.copyWith(fontFamily: 'GB'),
        )
      ],
    );
  }
}
