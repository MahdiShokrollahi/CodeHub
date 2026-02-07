import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((value) =>
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/pattern1.png'),
              repeat: ImageRepeat.repeat)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Center(child: Image.asset('images/logo_splash.png')),
            ),
            Positioned(
                bottom: 32,
                child: Column(
                  children: [
                    Text(
                      'from',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'ExpertFlutter',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
