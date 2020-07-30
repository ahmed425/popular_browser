import 'dart:async';
import 'package:flutter/material.dart';
import 'package:popularbrowser/constants.dart';
import 'package:popularbrowser/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => LoginPage(),
              ),
            ));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: headerColour,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Image.asset(
            'assets/icons/mylogo.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
