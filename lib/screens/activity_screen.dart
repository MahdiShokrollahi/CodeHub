import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/model/activity_type_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    setState(() {
      _controller = TabController(length: 2, vsync: this);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(color: Color(0xff1C1F2E)),
            child: TabBar(
                controller: _controller,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                indicatorColor: themeData.colorScheme.primary,
                indicatorWeight: 4,
                labelStyle: themeData.textTheme.headline6,
                tabs: [
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  )
                ]),
          ),
          Expanded(
            child: TabBarView(controller: _controller, children: [
              _getSampleList(themeData),
              _getSampleList(themeData)
            ]),
          )
        ],
      )),
    );
  }

  Widget _getSampleList(ThemeData themeData) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(left: 20, top: 30),
          sliver: SliverToBoxAdapter(
            child: Text(
              'New',
              style: themeData.textTheme.button,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return _getRow(themeData, ActivityStatus.following);
        }, childCount: 5)),
        SliverPadding(
          padding: EdgeInsets.only(left: 20, top: 30),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Today',
              style: themeData.textTheme.button,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return _getRow(themeData, ActivityStatus.followBack);
        }, childCount: 5)),
        SliverPadding(
          padding: EdgeInsets.only(left: 20, top: 30),
          sliver: SliverToBoxAdapter(
            child: Text(
              'This Week',
              style: themeData.textTheme.button,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return _getRow(themeData, ActivityStatus.likes);
        }, childCount: 5)),
      ],
    );
  }

  Widget _getRow(ThemeData themeData, ActivityStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 7,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/profile.png'),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'MahdiShokrollahi',
                    style:
                        themeData.textTheme.caption!.copyWith(fontFamily: 'GB'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Started Following',
                    style:
                        themeData.textTheme.caption!.copyWith(fontFamily: 'GB'),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'you',
                    style:
                        themeData.textTheme.caption!.copyWith(fontFamily: 'GB'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '3min',
                    style:
                        themeData.textTheme.caption!.copyWith(fontFamily: 'GB'),
                  )
                ],
              ),
            ],
          ),
          Spacer(),
          _getActivityActionRow(status, themeData)
        ],
      ),
    );
  }

  Widget _getActivityActionRow(ActivityStatus status, ThemeData themeData) {
    switch (status) {
      case ActivityStatus.followBack:
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(70, 36),
              backgroundColor: Color(0xffF35383),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: () {},
            child: Text(
              'follow',
              style: themeData.textTheme.button,
            ));
      case ActivityStatus.following:
        return OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xffC5C5C5), width: 2)),
            onPressed: () {},
            child: Text(
              'Message',
              style: themeData.textTheme.caption!
                  .copyWith(color: Color(0xffC5C5C5), fontFamily: 'GB'),
            ));
      case ActivityStatus.likes:
        return SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/post3.png'),
            ),
          ),
        );

      default:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
                fontFamily: 'GB', fontSize: 12, color: Color(0xffC5C5C5)),
          ),
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Color(0xffC5C5C5), width: 2)),
        );
    }
  }
}
