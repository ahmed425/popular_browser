import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popularbrowser/classes/language.dart';
//import 'package:popularbrowser/localization/in_app_localization.dart';
import 'package:popularbrowser/localization/language_constants.dart';
//import 'package:popularbrowser/pages/login_page.dart';
//import 'package:popularbrowser/localization/language_constants.dart';
import 'package:popularbrowser/router/route_constants.dart';

import '../constants.dart';
import '../main.dart';
//import '../main.dart';
//import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  bool _showBody = false;

  String listDisplayOrHide;

  var myStyle =
      TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    if (_showBody == false) {
      setState(() {
        listDisplayOrHide = getTranslated(context, 'display');
        myStyle = TextStyle(
            color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold);
      });
    }
    final appBar = AppBar(
      backgroundColor: Color(0xFFFDBA35),
      actions: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton<Language>(
            hint: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                getTranslated(context, 'change_language'),
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ),
            underline: SizedBox(),
            icon: Icon(
              Icons.language,
              color: Colors.green,
            ),
            onChanged: (Language language) {
              _changeLanguage(language);
            },
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>(
                  (e) => DropdownMenuItem<Language>(
                    value: e,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[Text(e.name)],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
//      centerTitle: true,
      title: Text(
        getTranslated(context, 'browser'),
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
//        textAlign: TextAlign.center,
      ),
    );
    final headerPortrait = Container(
      color: headerColour,
//              padding: EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.4,
      child: Image.asset(
        'assets/icons/mylogo.png',
      ),
    );
    final bodyPortrait = Center(
      child: Container(
//        padding: EdgeInsets.only(top: 50),
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.6,
        width: MediaQuery.of(context).size.width,
//      padding: EdgeInsets.all(8),
//            margin: const EdgeInsets.all(5),
        color: gridViewItemsColor,
        child: Column(
//        scrollDirection: Axis.vertical,
//          shrinkWrap: false,
//          primary: true,
//        padding: const EdgeInsets.only(top: 30, bottom: 1),

//          crossAxisSpacing: 5,
//          mainAxisSpacing: 5,
//          crossAxisCount: 3,
          children: <Widget>[
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Container(
//            padding: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width / 3,
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          (7 / 30),
                      color: gridViewItemsColor,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/google.png',
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, google);
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          (7 / 30),
                      color: gridViewItemsColor,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/YouTube_Logo.png',
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, youtube);
                        },
                      ),
                    ),
                    Container(
//              padding: EdgeInsets.only(top: 100),
                      width: MediaQuery.of(context).size.width / 3,
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          (7 / 30),
                      color: gridViewItemsColor,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/face.png',
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, facebook);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          (7 / 30),
                      margin: EdgeInsets.only(top: 5),
                      color: gridViewItemsColor,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/twitter.png',
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, twitter);
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          (7 / 30),
                      color: gridViewItemsColor,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/udem.png',
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, udemy);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      width: MediaQuery.of(context).size.width / 3,
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          (7 / 30),
                      color: gridViewItemsColor,
                      child: InkWell(
                        child: Image.asset(
                          'assets/icons/instagram.png',
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, instagram);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
//                  margin: EdgeInsets.only(top: 5),
                        width: MediaQuery.of(context).size.width / 3,
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            (7 / 30),
                        color: gridViewItemsColor,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/wiki.png',
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, wikipedia);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
//                      margin: EdgeInsets.only(top: 5),
                        width: MediaQuery.of(context).size.width,
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            (7 / 30),
                        color: gridViewItemsColor,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/amazo.png',
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, amazon);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
//                      margin: EdgeInsets.only(top: 5),
                        width: MediaQuery.of(context).size.width / 3,
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            (7 / 30),
                        color: gridViewItemsColor,
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/linkedin.png',
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, linkedin);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

//    final footerPortrait = Container(
//      width: MediaQuery.of(context).size.width,
//      height: (MediaQuery.of(context).size.height -
//              appBar.preferredSize.height -
//              MediaQuery.of(context).padding.top) *
//          0.1,
////            margin: EdgeInsets.only(top: 10),
//      color: headerColour,
//      child: Image.asset('assets/icons/callhassab.png'),
//    );
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final bodyLandscape = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.88,
      width: MediaQuery.of(context).size.width,
//      padding: EdgeInsets.all(8),
//            margin: const EdgeInsets.all(5),
      color: bodyColour,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: true,
//        padding: const EdgeInsets.all(5),
//        crossAxisSpacing: 5,
//        mainAxisSpacing: 5,
//        crossAxisCount: 3,
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.2,
            width: MediaQuery.of(context).size.width * 0.25,
            color: gridViewItemsColor,
            child: InkWell(
              child: Image.asset(
                'assets/icons/google.png',
              ),
              onTap: () {
                Navigator.pushNamed(context, google);
              },
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.25,
            width: MediaQuery.of(context).size.width * 0.25,
            color: gridViewItemsColor,
            child: InkWell(
              child: Image.asset(
                'assets/icons/YouTube_Logo.png',
              ),
              onTap: () {
                Navigator.pushNamed(context, youtube);
              },
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.25,
            width: MediaQuery.of(context).size.width * 0.25,
            color: gridViewItemsColor,
            child: InkWell(
              child: Image.asset(
                'assets/icons/face.png',
              ),
              onTap: () {
                Navigator.pushNamed(context, facebook);
              },
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.25,
            width: MediaQuery.of(context).size.width * 0.25,
            color: gridViewItemsColor,
            child: InkWell(
              child: Image.asset(
                'assets/icons/twitter.png',
              ),
              onTap: () {
                Navigator.pushNamed(context, twitter);
              },
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.25,
            width: MediaQuery.of(context).size.width * 0.25,
            color: gridViewItemsColor,
            child: InkWell(
              child: Image.asset(
                'assets/icons/udem.png',
              ),
              onTap: () {
                Navigator.pushNamed(context, udemy);
              },
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.25,
            width: MediaQuery.of(context).size.width * 0.25,
            color: gridViewItemsColor,
            child: InkWell(
              child: Image.asset(
                'assets/icons/instagram.png',
              ),
              onTap: () {
                Navigator.pushNamed(context, instagram);
              },
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.25,
            width: MediaQuery.of(context).size.width * 0.25,
            color: gridViewItemsColor,
            child: InkWell(
              child: Image.asset(
                'assets/icons/wiki.png',
              ),
              onTap: () {
                Navigator.pushNamed(context, wikipedia);
              },
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.25,
            width: MediaQuery.of(context).size.width * 0.25,
            color: gridViewItemsColor,
            child: InkWell(
              child: Image.asset(
                'assets/icons/amazo.png',
              ),
              onTap: () {
                Navigator.pushNamed(context, amazon);
              },
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.25,
            width: MediaQuery.of(context).size.width * 0.25,
            color: gridViewItemsColor,
            child: InkWell(
              child: Image.asset(
                'assets/icons/linkedin.png',
              ),
              onTap: () {
                Navigator.pushNamed(context, linkedin);
              },
            ),
          ),
        ],
      ),
    );
//    Container(
//      height: (MediaQuery.of(context).size.height -
//              appBar.preferredSize.height -
//              MediaQuery.of(context).padding.top) *
//          0.6,
//      width: MediaQuery.of(context).size.width,
//      padding: EdgeInsets.all(8),
////            margin: const EdgeInsets.all(5),
//      color: bodyColour,
//      child: GridView.count(
//        scrollDirection: Axis.vertical,
//        shrinkWrap: true,
//        primary: true,
//        padding: const EdgeInsets.all(5),
//        crossAxisSpacing: 5,
//        mainAxisSpacing: 5,
//        crossAxisCount: 3,
//        children: <Widget>[
//          Container(
//            color: gridViewItemsColor,
//            child: Column(
//              children: <Widget>[
//                InkWell(
//                  child: Container(
//                    color: gridViewItemsColor,
//                    padding: const EdgeInsets.all(8),
////                          width: 80,
////                          height: 50,
//                    child: Column(
//                      children: <Widget>[
//                        Container(
////                          width: 80,
////                          height: 50,
//                          child: Image.asset(
//                            'assets/icons/branches.png',
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  onTap: () {},
//                ),
//                Expanded(
//                  child: Text(
//                    getTranslated((context), 'branches'),
//                    style: arabicTextStyle,
//                  ),
//                )
//              ],
//            ),
//          ),
//          Container(
//            color: gridViewItemsColor,
//            child: Column(
//              children: <Widget>[
//                InkWell(
//                  child: Container(
//                    color: gridViewItemsColor,
//                    padding: const EdgeInsets.all(8),
////                          width: 80,
////                          height: 50,
//                    child: Column(
//                      children: <Widget>[
//                        Container(
////                          width: 80,
////                          height: 50,
//                          child: Image.asset(
//                            'assets/icons/results.png',
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  onTap: () {},
//                ),
//                Expanded(
//                  child: Text(
//                    getTranslated((context), 'results'),
//                    style: arabicTextStyle,
//                  ),
//                )
//              ],
//            ),
//          ),
//          Container(
//            color: gridViewItemsColor,
//            child: Column(
//              children: <Widget>[
//                InkWell(
//                  child: Container(
//                    color: gridViewItemsColor,
//                    padding: const EdgeInsets.all(8),
////                          width: 80,
////                          height: 50,
//                    child: Column(
//                      children: <Widget>[
//                        Container(
////                          width: 80,
////                          height: 50,
//                          child: Image.asset(
//                            'assets/icons/about_hassab.png',
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  onTap: () {
//                    Navigator.pushNamed(context, aboutRoute);
//                  },
//                ),
//                Expanded(
//                  child: Text(
//                    getTranslated((context), 'about_hassab'),
//                    style: arabicTextStyle,
//                  ),
//                )
//              ],
//            ),
//          ),
//          Container(
//            color: gridViewItemsColor,
//            child: Column(
//              children: <Widget>[
//                InkWell(
//                  child: Container(
//                    color: gridViewItemsColor,
//                    padding: const EdgeInsets.all(8),
////                          width: 80,
////                          height: 50,
//                    child: Column(
//                      children: <Widget>[
//                        Container(
////                          width: 80,
////                          height: 50,
//                          child: Image.asset(
//                            'assets/icons/list.png',
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  onTap: () {},
//                ),
//                Expanded(
//                  child: Text(
//                    getTranslated((context), 'list'),
//                    style: arabicTextStyle,
//                  ),
//                )
//              ],
//            ),
//          ),
//          Container(
//            color: gridViewItemsColor,
//            child: Column(
//              children: <Widget>[
//                InkWell(
//                  child: Container(
//                    color: gridViewItemsColor,
//                    padding: const EdgeInsets.all(8),
////                          width: 80,
////                          height: 50,
//                    child: Column(
//                      children: <Widget>[
//                        Container(
////                          width: 80,
////                          height: 50,
//                          child: Image.asset(
//                            'assets/icons/library.png',
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  onTap: () {},
//                ),
//                Expanded(
//                  child: Text(
//                    getTranslated((context), 'library'),
//                    style: arabicTextStyle,
//                  ),
//                )
//              ],
//            ),
//          ),
//          Container(
//            color: gridViewItemsColor,
//            child: Column(
//              children: <Widget>[
//                InkWell(
//                  child: Container(
//                    color: gridViewItemsColor,
//                    padding: const EdgeInsets.all(8),
////                          width: 80,
////                          height: 50,
//                    child: Column(
//                      children: <Widget>[
//                        Container(
////                          width: 80,
////                          height: 50,
//                          child: Image.asset(
//                            'assets/icons/visit.png',
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  onTap: () {},
//                ),
//                Expanded(
//                  child: Text(
//                    getTranslated((context), 'home_visit'),
//                    style: arabicTextStyle,
//                  ),
//                )
//              ],
//            ),
//          ),
//          Container(
//            color: gridViewItemsColor,
//            child: Column(
//              children: <Widget>[
//                InkWell(
//                  child: Container(
//                    color: gridViewItemsColor,
//                    padding: const EdgeInsets.all(8),
////                          width: 80,
////                          height: 50,
//                    child: Column(
//                      children: <Widget>[
//                        Container(
////                          width: 80,
////                          height: 50,
//                          child: Image.asset(
//                            'assets/icons/opinion.png',
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  onTap: () {},
//                ),
//                Expanded(
//                  child: Text(
//                    getTranslated((context), 'opinion'),
//                    overflow: TextOverflow.visible,
//                    style: arabicTextStyle,
//                  ),
//                )
//              ],
//            ),
//          ),
//          Container(
//            color: gridViewItemsColor,
//            child: Column(
//              children: <Widget>[
//                InkWell(
//                  child: Container(
//                    color: gridViewItemsColor,
//                    padding: const EdgeInsets.all(8),
////                          width: 80,
////                          height: 50,
//                    child: Column(
//                      children: <Widget>[
//                        Container(
////                          width: 80,
////                          height: 50,
//                          child: Image.asset(
//                            'assets/icons/offers.png',
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  onTap: () {},
//                ),
//                Expanded(
//                  child: Text(
//                    getTranslated((context), 'offers'),
//                    style: arabicTextStyle,
//                  ),
//                )
//              ],
//            ),
//          ),
//          Container(
//            color: gridViewItemsColor,
//            child: Column(
//              children: <Widget>[
//                InkWell(
//                  child: Container(
//                    color: gridViewItemsColor,
//                    padding: const EdgeInsets.all(8),
////                          width: 80,
////                          height: 50,
//                    child: Column(
//                      children: <Widget>[
//                        Container(
////                          width: 80,
////                          height: 50,
//                          child: Image.asset(
//                            'assets/icons/advice.png',
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  onTap: () {},
//                ),
//                Expanded(
//                  child: Text(
//                    getTranslated((context), 'advice'),
//                    style: arabicTextStyle,
//                  ),
//                )
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//    final footerLandscape = Container(
//        width: MediaQuery.of(context).size.width,
//        height: (MediaQuery.of(context).size.height -
//                appBar.preferredSize.height -
//                MediaQuery.of(context).padding.top) *
//            0.18,
////            margin: EdgeInsets.only(top: 10),
//        color: headerColour,
//        child: Image.asset('assets/icons/callhassab.png'));
    final headerLandscape = Center(
        child: Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.88,
            width: MediaQuery.of(context).size.width,
//              margin: EdgeInsets.only(bottom: 5),
            color: Color(0xFFFDBA35),
            child: Image.asset(
              'assets/icons/mylogo.png',
            )
//            Center(
//              child: SingleChildScrollView(
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Center(
//                      child: Container(
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            Expanded(
//                              child: InkWell(
//                                child: Container(
////                          width: 80,
////                          height: 50,
//                                  child: Column(
//                                    children: <Widget>[
//                                      Container(
//                                        height: (MediaQuery.of(context)
//                                                    .size
//                                                    .height -
//                                                appBar.preferredSize.height -
//                                                MediaQuery.of(context)
//                                                    .padding
//                                                    .top) *
//                                            0.25,
//                                        width: (MediaQuery.of(context)
//                                                .size
//                                                .width) *
//                                            (1 / 3),
////                                width: 50,
////                                height: 40,
//                                        child: Image.asset(
//                                          'assets/icons/home1.png',
//                                        ),
//                                      ),
//                                      Text(
//                                        getTranslated(context, 'home_page'),
//                                        style: arabicTextStyle,
//                                      )
//                                    ],
//                                  ),
//                                ),
//                                onTap: () {},
//                              ),
//                            ),
//                            Container(
//                              padding: EdgeInsets.only(top: 5),
////                      width: 120,
//                              height: (MediaQuery.of(context).size.height -
//                                      appBar.preferredSize.height -
//                                      MediaQuery.of(context).padding.top) *
//                                  0.5,
//                              width:
//                                  (MediaQuery.of(context).size.width) * (1 / 3),
////                      height: 85,
//                              child: Image.asset(
//                                'assets/icons/logo_home.png',
//                              ),
//                            ),
//                            Expanded(
//                              child: InkWell(
//                                child: Container(
////                          width: 80,
////                          height: 50,
//                                  child: Column(
//                                    children: <Widget>[
//                                      Container(
//                                        height: (MediaQuery.of(context)
//                                                    .size
//                                                    .height -
//                                                appBar.preferredSize.height -
//                                                MediaQuery.of(context)
//                                                    .padding
//                                                    .top) *
//                                            0.25,
//                                        width: (MediaQuery.of(context)
//                                                .size
//                                                .width) *
//                                            (1 / 3),
////                                color: gridViewItemsColor,
////                                width: 80,
////                                height: 40,
//                                        child: Image.asset(
//                                          'assets/icons/login2.png',
//                                        ),
//                                      ),
//                                      Text(
//                                        getTranslated(context, 'login'),
//                                        style: arabicTextStyle,
//                                      )
//                                    ],
//                                  ),
//                                ),
//                                onTap: () {
//                                  Navigator.pushNamed(context, loginRoute);
//                                },
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            )
//          color: Color(0xFF474747),
            ));
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[
//          if (isLandscape)
//            Container(
//              height: (MediaQuery.of(context).size.height -
//                      appBar.preferredSize.height -
//                      MediaQuery.of(context).padding.top) *
//                  0.05,
//              width: MediaQuery.of(context).size.width,
//              child: Container(
//                color: headerColour,
//              ),
//            ),
          if (isLandscape)
            Center(
              child: Container(
                color: headerColour,
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.12,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          listDisplayOrHide,
                          style: myStyle,
                        ),
                      ),
                      Switch(
                        activeColor: Colors.green,
                        inactiveTrackColor: Colors.white,
                        value: _showBody,
                        onChanged: (val) {
                          setState(() {
                            _showBody = val;
                            print(_showBody);
                            listDisplayOrHide = getTranslated(context, 'hide');
                            myStyle = TextStyle(
                                color: Colors.green,
                                fontSize: 22,
                                fontWeight: FontWeight.bold);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
//          if (isLandscape)
//            SizedBox(
//              height: (MediaQuery.of(context).size.height -
//                      appBar.preferredSize.height -
//                      MediaQuery.of(context).padding.top) *
//                  0.05,
//              width: MediaQuery.of(context).size.width,
//              child: Container(
//                color: headerColour,
//              ),
//            ),
          if (isLandscape)
            _showBody
                ? Column(
                    children: <Widget>[
                      bodyLandscape,
//                      footerLandscape,
                    ],
                  )
                : headerLandscape,
          if (!isLandscape)
            headerPortrait,
          if (!isLandscape)
            bodyPortrait,
//          if (!isLandscape)
//            footerPortrait,
        ],
      ),
    );
  }
}
//          Container(
//            height: (MediaQuery.of(context).size.height -
//                    appBar.preferredSize.height -
//                    MediaQuery.of(context).padding.top) *
//                0.05,
//            color: headerColour,
//            child: SizedBox(
//              height: 0,
//            ),
//          ),
//

//          SizedBox(
//            width: MediaQuery.of(context).size.width,
//            height: (MediaQuery.of(context).size.height -
//                    appBar.preferredSize.height -
//                    MediaQuery.of(context).padding.top) *
//                0.01,
//          ),
//          Container(
//              padding: EdgeInsets.all(20),
////                    width: MediaQuery.of(context).size.width,
////                    height: MediaQuery.of(context).size.height / 3,
//              color: Color(0xFFFDBA35),
//              child: Column(
//                children: <Widget>[
//                  Text(
//                    textAlign: TextAlign.center,
//                  ),
//                  CircleAvatar(
//                    radius: 50.0,
//                    backgroundImage: AssetImage('assets/icons/hassab_icon.png'),
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceAround,
//                    children: <Widget>[
//                      InkWell(
//                        child: Container(
////                    width: 80,
////                    height: 50,
//                          child: Image.asset(
//                            'assets/icons/icon_test.png',
//                          ),
//                        ),
//                        onTap: () {},
//                      ),
//                      InkWell(
//                        child: Container(
////                    width: 80,
////                    height: 50,
//                          child: Image.asset(
//                            'assets/icons/icon_test.png',
//                          ),
//                        ),
//                        onTap: () {},
//                      ),
//                    ],
//                  )
//                ],
//              )
////          color: Color(0xFF474747),
//              ),
//          GridView.count(
//            primary: false,
////              padding: const EdgeInsets.all(20),
//            crossAxisSpacing: 10,
//            mainAxisSpacing: 10,
//            crossAxisCount: 2,
//            children: <Widget>[
//              Container(
//                padding: const EdgeInsets.all(8),
//                child: const Text("He'd have you all unravel at the"),
//                color: Colors.teal[100],
//              ),
//              Container(
//                padding: const EdgeInsets.all(8),
//                child: const Text('Heed not the rabble'),
//                color: Colors.teal[200],
//              ),
//              Container(
//                padding: const EdgeInsets.all(8),
//                child: const Text('Sound of screams but the'),
//                color: Colors.teal[300],
//              ),
//              Container(
//                padding: const EdgeInsets.all(8),
//                child: const Text('Who scream'),
//                color: Colors.teal[400],
//              ),
//              Container(
//                padding: const EdgeInsets.all(8),
//                child: const Text('Revolution is coming...'),
//                color: Colors.teal[500],
//              ),
//              Container(
//                padding: const EdgeInsets.all(8),
//                child: const Text('Revolution, they...'),
//                color: Colors.teal[600],
//              ),
//            ],
//          ),
