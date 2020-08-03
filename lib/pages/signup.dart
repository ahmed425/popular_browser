import 'package:flutter/material.dart';
import 'package:popularbrowser/constants.dart';
import 'package:popularbrowser/localization/language_constants.dart';
import 'package:popularbrowser/pages/home_page.dart';
import 'package:popularbrowser/pages/login_page.dart';
import 'package:popularbrowser/providers/auth.dart';
import 'package:provider/provider.dart';

enum AuthMode { Login, Signup }

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _pwdFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _submitLoading = false;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _passwordController;
  Future<void> _submit() async {
    print(_authData['email']);
    if (!_formKey.currentState.validate()) {
      print("formKey.currentState IS Invalid");
      return;
    }
    _formKey.currentState.save();

    setState(() {
      _submitLoading = true;
    });
    print(_authData['email'].toString());
    try {
      await Provider.of<Auth>(context, listen: false)
          .signup(
            _authData['email'],
            _authData['password'],
          )
          .then((_) => _submitLoading = false);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } catch (error) {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Color(0xFFFDBA35),
      centerTitle: true,
      title: Text(
        getTranslated(context, 'login_button_text'),
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
        textAlign: TextAlign.center,
      ),
    );
    final loginPortrait = Center(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width / 2,
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.28,
            child: Image.asset(
              'assets/icons/mylogo.png',
            ),
          ),
          Container(
            child: Center(
              child: Text(
                getTranslated(context, 'welcome'),
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                        child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[200]),
                                ),
                              ),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_pwdFocusNode);
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: getTranslated(context, 'email'),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Color.fromRGBO(1, 123, 126, 1),
                                  ),
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value);
                                  if (!emailValid) {
                                    bool spaceRex =
                                        new RegExp(r"^\\s+$").hasMatch(value);
                                    if (spaceRex ||
                                        value.length == 0 ||
                                        value == null) {
                                      return 'ادخل البريد الإلكتروني من فضلك';
                                    } else {
                                      return 'البريد الإلكتروني غير صالح';
                                    }
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _authData['email'] = value;
                                },
                              ),
                            ),
//                                        if (_authMode == AuthMode.Login)
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[200]),
                                ),
                              ),
                              child: TextFormField(
                                focusNode: _pwdFocusNode,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        getTranslated(context, 'password'),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Color.fromRGBO(1, 123, 126, 1),
                                    ),
                                    hintStyle: TextStyle(color: Colors.white)),
                                obscureText: true,
                                controller: _passwordController,
                                onSaved: (value) {
                                  _authData['password'] = value;
                                },
                                validator: (value) {
                                  bool spaceRex =
                                      new RegExp(r"^\\s+$").hasMatch(value);
                                  if (spaceRex ||
                                      value.length == 0 ||
                                      value == null) {
                                    return 'ادخل  كلمة المرور من فضلك';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: (MediaQuery.of(context).size.height -
                                      appBar.preferredSize.height -
                                      MediaQuery.of(context).padding.top) *
                                  0.02,
                            ),
                            InkWell(
                              onTap: () {
                                _submitLoading = true;
                                print(_authData['email']);
                                _submit();
                              },
                              child: Container(
                                height: 45,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: gridViewItemsColor,
                                ),
                                child: Center(
                                  child: _submitLoading == false
                                      ? Text(
                                          getTranslated(context, 'signup'),
//                                                            : 'إرسال رابط تغيير كلمة المرور',
                                          style: buttonTextStyle,
                                        )
                                      : CircularProgressIndicator(
                                          backgroundColor: Colors.white,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
    final loginLandscape = ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 10),
          height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top) *
              0.3,
          child: Image.asset(
            'assets/icons/mylogo.png',
          ),
        ),
        Container(
          height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top) *
              0.1,
          child: Center(
            child: Text(
              getTranslated(context, 'welcome'),
              style: TextStyle(
                color: Colors.green,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top) *
              0.55,
          child: Column(
            children: <Widget>[
              Container(
                  child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey[200]),
                          ),
                        ),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_pwdFocusNode);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: getTranslated(context, 'email'),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color.fromRGBO(1, 123, 126, 1),
                            ),
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value);
                            if (!emailValid) {
                              bool spaceRex =
                                  new RegExp(r"^\\s+$").hasMatch(value);
                              if (spaceRex ||
                                  value.length == 0 ||
                                  value == null) {
                                return getTranslated(context, 'mail_please');
                              } else {
                                return getTranslated(context, 'invalid_email');
                              }
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _authData['email'] = value;
                          },
                        ),
                      ),
//                                        if (_authMode == AuthMode.Login)
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey[200]),
                          ),
                        ),
                        child: TextFormField(
                          focusNode: _pwdFocusNode,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: getTranslated(context, 'password'),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color.fromRGBO(1, 123, 126, 1),
                              ),
                              hintStyle: TextStyle(color: Colors.white)),
                          obscureText: true,
                          controller: _passwordController,
                          onSaved: (value) {
                            _authData['password'] = value;
                          },
                          validator: (value) {
                            bool spaceRex =
                                new RegExp(r"^\\s+$").hasMatch(value);
                            if (spaceRex ||
                                value.length == 0 ||
                                value == null) {
                              return getTranslated(context, 'password_please');
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.03,
                      ),
                      InkWell(
                        onTap: () {
                          _submitLoading = true;
                          _submit();
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
//                            color: Color.fromRGBO(49, 39, 79, 1),
                            color: gridViewItemsColor,
                          ),
                          child: Center(
                            child: _submitLoading == false
                                ? Text(
                                    getTranslated(context, 'signup'),
//                                                            : 'إرسال رابط تغيير كلمة المرور',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )
                                : CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ],
    );

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
        appBar: appBar,
        backgroundColor: headerColour,
        body: isLandscape ? loginLandscape : loginPortrait);
  }
}
