import 'dart:async';
//import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Wikipedia extends StatefulWidget {
  @override
  _WikipediaState createState() => _WikipediaState();
}

class _WikipediaState extends State<Wikipedia> {
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
        title: Text('Wikipedia'),
      ),
      body: Stack(
        children: <Widget>[
          new WebView(
            initialUrl: "https://en.wikipedia.org",
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
}
