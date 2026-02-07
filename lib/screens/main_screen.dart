import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/activity_screen.dart';
import 'package:instagram_clone/screens/add_post_screen.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/search_screen.dart';
import 'package:instagram_clone/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              backgroundColor: Color(0xff272B40),
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset('images/bottonnav1.png'),
                    activeIcon: Image.asset('images/icon_active_home.png'),
                    label: 'item0'),
                BottomNavigationBarItem(
                    icon: Image.asset('images/bottonnav2.png'),
                    activeIcon:
                        Image.asset('images/icon_search_navigation_active.png'),
                    label: 'item1'),
                BottomNavigationBarItem(
                    icon: Image.asset('images/bottonnav3.png'),
                    activeIcon:
                        Image.asset('images/icon_add_navigation_active.png'),
                    label: 'item2'),
                BottomNavigationBarItem(
                    icon: Image.asset('images/bottonnav4.png'),
                    activeIcon: Image.asset(
                        'images/icon_activity_navigation_active.png'),
                    label: 'item3'),
                BottomNavigationBarItem(
                    icon: Container(
                      height: 30,
                      width: 30,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border:
                              Border.all(color: Color(0xffC5C5C5), width: 2)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          child: Image.asset(
                            'images/profile.png',
                            fit: BoxFit.cover,
                          )),
                    ),
                    activeIcon: Container(
                      height: 30,
                      width: 30,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border:
                              Border.all(color: Color(0xffF35383), width: 2)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          child: Image.asset(
                            'images/profile.png',
                            fit: BoxFit.cover,
                          )),
                    ),
                    label: 'item3'),
              ]),
        ),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: getScreen(),
      ),
    );
  }

  List<Widget> getScreen() {
    return [
      HomeScreen(),
      SearchScreen(),
      AddPostScreen(),
      ActivityScreen(),
      UserProfileScreen()
    ];
  }
}
