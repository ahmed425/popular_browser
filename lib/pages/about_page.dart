import 'package:flutter/material.dart';
import 'package:popularbrowser/constants.dart';
import 'package:popularbrowser/localization/language_constants.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  var appBar;
  @override
  Widget build(BuildContext context) {
    appBar = AppBar(
      backgroundColor: Color(0xFFFDBA35),
      title: Text(
        getTranslated(context, 'about_hassab'),
        style: appBarTextStyle,
      ),
    );
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final aboutPortrait = SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/icons/about1.png',
            fit: BoxFit.fill,
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) /
                3,
            width: MediaQuery.of(context).size.width,
          ),
          Image.asset(
            'assets/icons/about2.png',
            fit: BoxFit.fill,
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) /
                3,
            width: MediaQuery.of(context).size.width,
          ),
          Image.asset(
            'assets/icons/about3.png',
            fit: BoxFit.fill,
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) /
                3,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
    final aboutLandScape = ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Image.asset(
          'assets/icons/about1.png',
          fit: BoxFit.fill,
          height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top),
          width: MediaQuery.of(context).size.width / 3,
        ),
        Image.asset(
          'assets/icons/about2.png',
          fit: BoxFit.fill,
          height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top),
          width: MediaQuery.of(context).size.width / 3,
        ),
        Image.asset(
          'assets/icons/about3.png',
          fit: BoxFit.fill,
          height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top),
          width: MediaQuery.of(context).size.width / 3,
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: isLandscape ? aboutLandScape : aboutPortrait,
    );
  }
}
