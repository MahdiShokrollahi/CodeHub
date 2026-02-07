import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/main_screen.dart';

class SwitchAccountScreen extends StatefulWidget {
  const SwitchAccountScreen({super.key});

  @override
  State<SwitchAccountScreen> createState() => _SwitchAccountScreenState();
}

class _SwitchAccountScreenState extends State<SwitchAccountScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'images/switch_account_background.png'),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    top: 220,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          height: 352,
                          width: 340,
                          padding: EdgeInsets.only(top: 32),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(255, 255, 255, 0.5),
                                Color.fromRGBO(255, 255, 255, 0.2)
                              ])),
                          child: Column(
                            children: [
                              Image.asset('images/profile.png'),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'MahdiShokrollahy',
                                style: themeData.textTheme.button,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  style: themeData.elevatedButtonTheme.style,
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainScreen()));
                                  },
                                  child: Text('Confirm',
                                      style: themeData.textTheme.button)),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'switch account',
                                style: themeData.textTheme.button,
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            )),
            Padding(
              padding: EdgeInsets.only(top: 80, bottom: 63),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account? /',
                    style: themeData.textTheme.button!
                        .copyWith(color: Color(0xffC5C5C5)),
                  ),
                  Text(
                    'Sign up',
                    style: themeData.textTheme.button,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
