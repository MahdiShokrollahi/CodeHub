import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/switch_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    emailFocusNode.addListener(() {
      setState(() {});
    });
    passwordFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff323A99), Color(0xffF98BFC)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [_getImageBox(), _getContainerBox(themeData)],
        ),
      ),
    );
  }

  Column _getContainerBox(ThemeData themeData) {
    return Column(
      children: [
        Expanded(child: Container()),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              color: Color(0xff1C1F2E),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 50,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign in to',
                    style: themeData.textTheme.subtitle1,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset('images/mood.png')
                ],
              ),
              SizedBox(
                height: 34,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  focusNode: emailFocusNode,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: themeData.textTheme.subtitle1!.copyWith(
                          fontFamily: 'GM',
                          color: emailFocusNode.hasFocus
                              ? themeData.colorScheme.primary
                              : themeData.colorScheme.outline),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                            color: themeData.colorScheme.outline, width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: themeData.colorScheme.primary, width: 3)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  focusNode: passwordFocusNode,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: themeData.textTheme.subtitle1!.copyWith(
                          fontFamily: 'GM',
                          color: passwordFocusNode.hasFocus
                              ? themeData.colorScheme.primary
                              : themeData.colorScheme.outline),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                            color: themeData.colorScheme.outline, width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: themeData.colorScheme.primary, width: 3)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SwitchAccountScreen()));
                  },
                  style: themeData.elevatedButtonTheme.style,
                  child: Text(
                    'sign in',
                    style: themeData.textTheme.button,
                  )),
              SizedBox(
                height: 30,
              ),
              Row(
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
              )
            ],
          ),
        ))
      ],
    );
  }

  Widget _getImageBox() {
    return Positioned(
      right: 0,
      left: 0,
      bottom: 0,
      top: 80,
      child: Column(
        children: [
          Expanded(child: Image.asset('images/rocket.png')),
          Expanded(child: Container())
        ],
      ),
    );
  }
}
