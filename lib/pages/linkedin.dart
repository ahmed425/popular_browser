import 'dart:async';
//import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Linkedin extends StatefulWidget {
  @override
  _LinkedinState createState() => _LinkedinState();
}

class _LinkedinState extends State<Linkedin> {
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
        title: Text('Linkedin'),
      ),
      body: Stack(
        children: <Widget>[
          new WebView(
            initialUrl: "https://www.linkedin.com/",
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
