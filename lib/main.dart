import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/locator.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/main_screen.dart';
import 'package:instagram_clone/utils/constants/constant.dart';
import 'package:instagram_clone/screens/splash_screen.dart';

void main() async {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xff1C1F2E)));
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.light(
              primary: primaryColor, outline: secondrytextColor),
          textTheme: TextTheme(
              bodyText1: TextStyle(
                  fontSize: 10,
                  fontFamily: 'SM',
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  height: 1.5),
              subtitle2: TextStyle(
                  fontSize: 14, fontFamily: 'GB', color: Colors.white),
              headline6: TextStyle(
                  fontSize: 20, color: Colors.white, fontFamily: 'GB'),
              caption: TextStyle(
                  fontSize: 12, fontFamily: 'GS', color: Colors.white),
              subtitle1: TextStyle(color: Colors.white, fontSize: 20),
              button: TextStyle(
                  fontSize: 16, fontFamily: 'GB', color: Colors.white)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: Size(129, 46),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))))),
      home: MainScreen(),
    );
  }
}
