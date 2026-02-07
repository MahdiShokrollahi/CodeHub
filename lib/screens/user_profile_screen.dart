import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder: ((context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  elevation: 0,
                  expandedHeight: 170,
                  toolbarHeight: 80,
                  backgroundColor: Color(0xff1C1F2E),
                  actions: [Image.asset('images/icon_menu2.png')],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'images/appbarBackground.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                  bottom: PreferredSize(
                      child: Container(
                        height: 14,
                        decoration: BoxDecoration(
                            color: Color(0xff1C1F2E),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            )),
                      ),
                      preferredSize: Size.fromHeight(14)),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  sliver: SliverToBoxAdapter(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                border: Border.all(
                                    color: Color(0xffF35383), width: 2)),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13)),
                              child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset('images/profile.png')),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 70,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'امیراحمد برنامه نویس موبایل',
                                    style: themeData.textTheme.subtitle2!
                                        .copyWith(fontFamily: 'SM'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'amriahmadadibi',
                                    style: themeData.textTheme.caption!
                                        .copyWith(
                                            fontFamily: 'GB',
                                            color: Color(0xffC5C5C5)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Image.asset('images/icon_profile_edit.png')
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'برنامه‌نویسی فلاتر و اندروید ، مدرس محبوب‌ترین \nدوره مـکتـبـخونـه و بـرنـامـه نـویـس سـابـق زریـن پـال \n تـخـصـص بـرنـامـه‌نـویسی یعنی اینده و تاثیر گذاری \n آموزش رایگان 👇',
                        style: themeData.textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset('images/icon_link.png'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'yek.link/Amirahmad',
                            style: themeData.textTheme.caption!.copyWith(
                                fontFamily: 'GB', color: Color(0xff55B9F7)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Row(
                        children: [
                          Image.asset('images/icon_box.png'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'developer',
                            style: themeData.textTheme.caption!.copyWith(
                                fontFamily: 'GB', color: Color(0xffC5C5C5)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            'images/icon_location.png',
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'IRAN',
                            style: themeData.textTheme.caption!.copyWith(
                                fontFamily: 'GM', color: Color(0xffC5C5C5)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            '23',
                            style: themeData.textTheme.subtitle2,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Posts',
                            style: themeData.textTheme.caption!.copyWith(
                                fontFamily: 'GM', color: Color(0xffC5C5C5)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '16.2K',
                            style: themeData.textTheme.subtitle2,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Followers',
                            style: themeData.textTheme.caption!.copyWith(
                                fontFamily: 'GM', color: Color(0xffC5C5C5)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '280',
                            style: themeData.textTheme.subtitle2,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Following',
                            style: themeData.textTheme.caption!.copyWith(
                                fontFamily: 'GM', color: Color(0xffC5C5C5)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Follow',
                                  style: themeData.textTheme.button,
                                )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    side: BorderSide(color: Color(0xffC5C5C5))),
                                onPressed: () {},
                                child: Text(
                                  'Message',
                                  style: themeData.textTheme.button,
                                )),
                          )
                        ],
                      ),
                    ],
                  )),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(right: 18, top: 32),
                  sliver: SliverToBoxAdapter(
                    child: SizedBox(
                      height: 90,
                      child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                children: [
                                  index == 0
                                      ? _AddStoryBox()
                                      : _StoryBox(index),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'New',
                                    style: themeData.textTheme.caption,
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 10),
                  sliver: SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: TabBarViewDelegate(TabBar(
                          indicatorColor: Color(0xffF35383),
                          indicatorPadding:
                              EdgeInsets.only(bottom: 4, right: 18, left: 18),
                          indicatorWeight: 2,
                          tabs: [
                            Tab(
                              icon: Image.asset('images/icon_post.png'),
                            ),
                            Tab(
                              icon: Image.asset('images/icon_bookmark.png'),
                            )
                          ]))),
                )
              ];
            }),
            body: TabBarView(children: [
              _itemTabarView(),
              _itemTabarView(),
            ])),
      ),
    );
  }

  Widget _itemTabarView() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/poste${index + 1}.png')),
                );
              }, childCount: 10),
              gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ])),
        )
      ],
    );
  }

  Widget _StoryBox(int index) {
    return Container(
      height: 60,
      width: 60,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Image.asset('images/story${index + 1}.png')),
    );
  }

  Widget _AddStoryBox() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(color: Colors.white, width: 2)),
      child: Image.asset('images/icon_plus.png'),
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  TabBarViewDelegate(this.tabBar);
  @override
  Widget build(Object context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color(0xff1C1F2E),
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
