import 'dart:async';
//import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Youtube extends StatefulWidget {
  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  final Completer<WebViewController> _controller =
      new Completer<WebViewController>();
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Youtube'),
      ),
      body: Stack(
        children: <Widget>[
          new WebView(
            initialUrl: "https://www.youtube.com",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (_) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          _isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

//  Future<bool> _onBackPressed() {
//    return showDialog(
//      context: context,
//      builder: (context) => (Platform.isAndroid)
//          ? new AlertDialog(
//        elevation: 25.0,
//        title: const Text('الخروج'),
//        content: const Text('هل تريد الخروج من التبرعات الخارجية ؟'),
//        actions: <Widget>[
//          new GestureDetector(
//            onTap: () => Navigator.of(context).pop(false),
//            child: Text("لا"),
//          ),
//          SizedBox(width: 30),
//          new GestureDetector(
//            onTap: () => Navigator.of(context).pop(true),
//            child: const Text("نعم",
//                style: TextStyle(
//                    color: Colors.red, fontWeight: FontWeight.bold)),
//          ),
//        ],
//      )
//          : CupertinoAlertDialog(
//        title: const Text('الخروج'),
//        content: const Text('هل تريد الخروج من التبرعات الخارجية ؟'),
//        actions: <Widget>[
//          CupertinoDialogAction(
//            child: const Text("نعم",
//                style: TextStyle(
//                    color: Colors.red, fontWeight: FontWeight.bold)),
//            isDefaultAction: true,
//            onPressed: () => Navigator.of(context).pop(true),
//          ),
//          CupertinoDialogAction(
//            child: const Text("لا"),
//            onPressed: () => Navigator.of(context).pop(false),
//          )
//        ],
//      ),
//    ) ??
//        false;
//  }
}
