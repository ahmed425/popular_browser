import 'dart:async';
import 'package:flutter/material.dart';
import 'package:popularbrowser/constants.dart';
import 'package:popularbrowser/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
//    var _isLoading = false;
//    Provider.of<Auth>(context).loadSharedPrefs().then((value) => {
//      if (value != null)
//        {
//          _isLoading = true,
//        }
//    });
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => HomePage(),
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
            'assets/icons/splash.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
