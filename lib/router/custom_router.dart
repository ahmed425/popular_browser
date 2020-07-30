import 'package:flutter/material.dart';
import 'package:popularbrowser/pages/about_page.dart';
import 'package:popularbrowser/pages/amazon.dart';
import 'package:popularbrowser/pages/facebook.dart';
import 'package:popularbrowser/pages/google.dart';
import 'package:popularbrowser/pages/home_page.dart';
import 'package:popularbrowser/pages/instagram.dart';
import 'package:popularbrowser/pages/linkedin.dart';
import 'package:popularbrowser/pages/login_page.dart';
import 'package:popularbrowser/pages/not_found_page.dart';
import 'package:popularbrowser/pages/settings_page.dart';
import 'package:popularbrowser/pages/twitter.dart';
import 'package:popularbrowser/pages/udemy.dart';
import 'package:popularbrowser/pages/wikipedia.dart';
import 'package:popularbrowser/pages/youtube.dart';
import 'package:popularbrowser/router/route_constants.dart';
import 'package:popularbrowser/splash_screen.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case google:
        return MaterialPageRoute(builder: (_) => Google());

      case youtube:
        return MaterialPageRoute(builder: (_) => Youtube());
      case facebook:
        return MaterialPageRoute(builder: (_) => Facebook());
      case wikipedia:
        return MaterialPageRoute(builder: (_) => Wikipedia());
      case twitter:
        return MaterialPageRoute(builder: (_) => Twitter());
      case udemy:
        return MaterialPageRoute(builder: (_) => Udemy());
      case amazon:
        return MaterialPageRoute(builder: (_) => Amazon());
      case linkedin:
        return MaterialPageRoute(builder: (_) => Linkedin());
      case instagram:
        return MaterialPageRoute(builder: (_) => Instagram());

      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
