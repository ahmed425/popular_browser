import 'package:flutter/material.dart';
import 'package:popularbrowser/constants.dart';
import 'package:popularbrowser/localization/language_constants.dart';
import 'package:popularbrowser/pages/home_page.dart';
import 'package:popularbrowser/providers/auth.dart';
import 'package:provider/provider.dart';

//import '../arc_banner_image.dart';
enum AuthMode { ResetPassword, Login }

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _pwdFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _submitLoading = false;
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _passwordController;
  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      print("formKey.currentState IS Invalid");
      return;
    }
    _formKey.currentState.save();

    setState(() {
      _submitLoading = true;
    });
    if (_authMode == AuthMode.Login) {
      try {
        await Provider.of<Auth>(context, listen: false).login(
          _authData['email'],
          _authData['password'],
        );

//        Provider.of<UsersProvider>(context, listen: false)
//            .setUserData(email: _authData['email'], userId: localId);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } catch (error) {
//        _showErrorDialog(errorMessage);
      }
    }
  }

//        await auth.resetPassword(_authData['email']);

//        Flushbar(
//          message: 'تم ارسال تغير رابط كلمة المرور',
//          icon: Icon(
//            Icons.thumb_up,
//            size: 28.0,
//            color: Colors.blue[300],
//          ),
//          duration: Duration(seconds: 3),
//          margin: const EdgeInsets.all(8),
//          borderRadius: 8,
//        )..show(context);
//      } catch (error) {
//        const errorMessage = 'البريد الإلكتروني غير موجود';
//        _showErrorDialog(errorM

  @override
  Widget build(BuildContext context) {
//    final width = MediaQuery.of(context).size.width;
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
              'assets/icons/logo_home.png',
            ),
          ),
          Container(
//            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
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
//            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
            child: Column(
              children: <Widget>[
//                SizedBox(
//                  height: 30,
//                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
//                        decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(10),
//                            color: Color(0xFFFDBA35),
//                            boxShadow: [
//                              BoxShadow(
//                                color: Color.fromRGBO(196, 135, 198, .3),
//                                blurRadius: 20,
//                                offset: Offset(0, 10),
//                              )
//                            ]),
                        child: Form(
//                                  key: _formKey,
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
//                                              _authData['email'] = value;
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
//                                              _authData['password'] = value;
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
                                print("Welcome to Hassab Labs");
                              },
                              child: Container(
                                height: 45,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
//                            color: Color.fromRGBO(49, 39, 79, 1),
                                  color: gridViewItemsColor,
                                ),
                                child: Center(
                                    child:
//                                                _submitLoading == false
                                        Text(
                                  getTranslated(context, 'login_button_text'),
//                                                            : 'إرسال رابط تغيير كلمة المرور',
                                  style: buttonTextStyle,
                                )
//                                                    : CircularProgressIndicator(
//                                                        backgroundColor:
//                                                            Colors.white,white
                                    ),
                              ),
                            ),
//                            Center(
//                                child:
////                                                _submitLoading == false
//                                    Container(
//                              color: Color.fromRGBO(1, 123, 126, 1),
//                              child: RaisedButton(
//                                shape: RoundedRectangleBorder(
//                                  borderRadius: new BorderRadius.circular(30.0),
//                                  side: BorderSide(
////                                      color: Color.fromRGBO(1, 123, 126, 1),
//                                      width: 2),
//                                ),
//                                child: Text(
//                                  getTranslated(context, 'login_button_text'),
////                                                            : 'إرسال رابط تغيير كلمة المرور',
//                                  style: buttonTextStyle,
//                                ),
//                              ),
//                            )
////                                                    : CircularProgressIndicator(
////                                                        backgroundColor:
////                                                            Colors.white,white
//                                ),
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
//    final loginLandscape =
//    final loginLandscape = ListView(
//      children: <Widget>[
//        Container(
//          padding: EdgeInsets.only(top: 10),
//          width: MediaQuery.of(context).size.width / 2,
//          height: (MediaQuery.of(context).size.height -
//                  appBar.preferredSize.height -
//                  MediaQuery.of(context).padding.top) *
//              0.4,
//          child: Image.asset(
//            'assets/icons/logo_home.png',
//          ),
//        ),
//        Container(
//          height: (MediaQuery.of(context).size.height -
//                  appBar.preferredSize.height -
//                  MediaQuery.of(context).padding.top) *
//              0.1,
////            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
//          child: Center(
//            child: Text(
//              getTranslated(context, 'welcome'),
//              style: TextStyle(
//                color: Colors.green,
//                fontSize: 21,
//                fontWeight: FontWeight.bold,
//              ),
//            ),
//          ),
//        ),
//        Container(
//          height: (MediaQuery.of(context).size.height -
//                  appBar.preferredSize.height -
//                  MediaQuery.of(context).padding.top) *
//              0.47,
////            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
//          child: Column(
//            children: <Widget>[
////                SizedBox(
////                  height: 30,
////                ),
//              Container(
////                        decoration: BoxDecoration(
////                            borderRadius: BorderRadius.circular(10),
////                            color: Color(0xFFFDBA35),
////                            boxShadow: [
////                              BoxShadow(
////                                color: Color.fromRGBO(196, 135, 198, .3),
////                                blurRadius: 20,
////                                offset: Offset(0, 10),
////                              )
////                            ]),
//
//                  child: Form(
////                                  key: _formKey,
//                child: SingleChildScrollView(
//                  child: Column(
//                    children: <Widget>[
//                      Container(
////                          padding: const EdgeInsets.all(10),
//                        decoration: BoxDecoration(
//                          border: Border(
//                            bottom: BorderSide(color: Colors.grey[200]),
//                          ),
//                        ),
//                        child: TextFormField(
//                          textInputAction: TextInputAction.next,
//                          onFieldSubmitted: (_) {
//                            FocusScope.of(context).requestFocus(_pwdFocusNode);
//                          },
//                          decoration: InputDecoration(
//                            border: InputBorder.none,
//                            hintText: getTranslated(context, 'email'),
//                            prefixIcon: Icon(
//                              Icons.email,
//                              color: Color.fromRGBO(1, 123, 126, 1),
//                            ),
//                            hintStyle: TextStyle(color: Colors.white),
//                          ),
//                          keyboardType: TextInputType.emailAddress,
//                          validator: (value) {
//                            bool emailValid = RegExp(
//                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                .hasMatch(value);
//                            if (!emailValid) {
//                              bool spaceRex =
//                                  new RegExp(r"^\\s+$").hasMatch(value);
//                              if (spaceRex ||
//                                  value.length == 0 ||
//                                  value == null) {
//                                return 'ادخل البريد الإلكتروني من فضلك';
//                              } else {
//                                return 'البريد الإلكتروني غير صالح';
//                              }
//                            }
//                            return null;
//                          },
//                          onSaved: (value) {
////                                              _authData['email'] = value;
//                          },
//                        ),
//                      ),
////                                        if (_authMode == AuthMode.Login)
//                      Container(
////                          padding: const EdgeInsets.all(10),
//                        decoration: BoxDecoration(
//                          border: Border(
//                            bottom: BorderSide(color: Colors.grey[200]),
//                          ),
//                        ),
//                        child: TextFormField(
//                          focusNode: _pwdFocusNode,
//                          decoration: InputDecoration(
//                              border: InputBorder.none,
//                              hintText: getTranslated(context, 'password'),
//                              prefixIcon: Icon(
//                                Icons.lock,
//                                color: Color.fromRGBO(1, 123, 126, 1),
//                              ),
//                              hintStyle: TextStyle(color: Colors.white)),
//                          obscureText: true,
//                          controller: _passwordController,
//                          onSaved: (value) {
////                                              _authData['password'] = value;
//                          },
//                          validator: (value) {
//                            bool spaceRex =
//                                new RegExp(r"^\\s+$").hasMatch(value);
//                            if (spaceRex ||
//                                value.length == 0 ||
//                                value == null) {
//                              return 'ادخل  كلمة المرور من فضلك';
//                            }
//                            return null;
//                          },
//                        ),
//                      ),
//                      SizedBox(
//                        height: (MediaQuery.of(context).size.height -
//                                appBar.preferredSize.height -
//                                MediaQuery.of(context).padding.top) *
//                            0.03,
//                      ),
//                      InkWell(
//                        onTap: () {
//                          print("Welcome to Hassab Labs");
//                        },
//                        child: Container(
////                        height: 45,
//                          margin: const EdgeInsets.symmetric(
//                            horizontal: 30,
//                          ),
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(50),
////                            color: Color.fromRGBO(49, 39, 79, 1),
//                            color: gridViewItemsColor,
//                          ),
//                          child: Center(
//                              child:
////                                                _submitLoading == false
//                                  Text(
//                            getTranslated(context, 'login_button_text'),
////                                                            : 'إرسال رابط تغيير كلمة المرور',
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontSize: 22,
//                                fontWeight: FontWeight.bold),
//                          )
////                                                    : CircularProgressIndicator(
////                                                        backgroundColor:
////                                                            Colors.white,white
//                              ),
//                        ),
//                      ),
////                            Center(
////                                child:
//////                                                _submitLoading == false
////                                    Container(
////                              color: Color.fromRGBO(1, 123, 126, 1),
////                              child: RaisedButton(
////                                shape: RoundedRectangleBorder(
////                                  borderRadius: new BorderRadius.circular(30.0),
////                                  side: BorderSide(
//////                                      color: Color.fromRGBO(1, 123, 126, 1),
////                                      width: 2),
////                                ),
////                                child: Text(
////                                  getTranslated(context, 'login_button_text'),
//////                                                            : 'إرسال رابط تغيير كلمة المرور',
////                                  style: buttonTextStyle,
////                                ),
////                              ),
////                            )
//////                                                    : CircularProgressIndicator(
//////                                                        backgroundColor:
//////                                                            Colors.white,white
////                                ),
//                    ],
//                  ),
//                ),
//              )),
//            ],
//          ),
//        ),
//      ],
//    );
    final loginLandscape = ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 10),
//          width: MediaQuery.of(context).size.,
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
//            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
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
//            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
          child: Column(
            children: <Widget>[
//                SizedBox(
//                  height: 30,
//                ),
              Container(
//                        decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(10),
//                            color: Color(0xFFFDBA35),
//                            boxShadow: [
//                              BoxShadow(
//                                color: Color.fromRGBO(196, 135, 198, .3),
//                                blurRadius: 20,
//                                offset: Offset(0, 10),
//                              )
//                            ]),

                  child: Form(
//                                  key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
//                          padding: const EdgeInsets.all(10),
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
                                return 'ادخل البريد الإلكتروني من فضلك';
                              } else {
                                return 'البريد الإلكتروني غير صالح';
                              }
                            }
                            return null;
                          },
                          onSaved: (value) {
//                                              _authData['email'] = value;
                          },
                        ),
                      ),
//                                        if (_authMode == AuthMode.Login)
                      Container(
//                          padding: const EdgeInsets.all(10),
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
//                                              _authData['password'] = value;
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
                            0.03,
                      ),
                      InkWell(
                        onTap: () {
                          if (!_submitLoading) {
                            _submit();
                          }
                        },
                        child: Container(
//                        height: 45,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
//                            color: Color.fromRGBO(49, 39, 79, 1),
                            color: gridViewItemsColor,
                          ),
                          child: Center(
                              child:
//                                                _submitLoading == false
                                  Text(
                            getTranslated(context, 'login_button_text'),
//                                                            : 'إرسال رابط تغيير كلمة المرور',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )
//                                                    : CircularProgressIndicator(
//                                                        backgroundColor:
//                                                            Colors.white,white
                              ),
                        ),
                      ),
//                            Center(
//                                child:
////                                                _submitLoading == false
//                                    Container(
//                              color: Color.fromRGBO(1, 123, 126, 1),
//                              child: RaisedButton(
//                                shape: RoundedRectangleBorder(
//                                  borderRadius: new BorderRadius.circular(30.0),
//                                  side: BorderSide(
////                                      color: Color.fromRGBO(1, 123, 126, 1),
//                                      width: 2),
//                                ),
//                                child: Text(
//                                  getTranslated(context, 'login_button_text'),
////                                                            : 'إرسال رابط تغيير كلمة المرور',
//                                  style: buttonTextStyle,
//                                ),
//                              ),
//                            )
////                                                    : CircularProgressIndicator(
////                                                        backgroundColor:
////                                                            Colors.white,white
//                                ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ],
    );

//    ListView(
//      children: <Widget>[
//        Container(
//          padding: EdgeInsets.only(top: 10),
//          width: MediaQuery.of(context).size.width / 2,
//          height: (MediaQuery.of(context).size.height -
//                  appBar.preferredSize.height -
//                  MediaQuery.of(context).padding.top) *
//              0.4,
//          child: Image.asset(
//            'assets/icons/logo_home.png',
//          ),
//        ),
//        Container(
//          height: (MediaQuery.of(context).size.height -
//                  appBar.preferredSize.height -
//                  MediaQuery.of(context).padding.top) *
//              0.1,
////            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
//          child: Center(
//            child: Text(
//              getTranslated(context, 'welcome'),
//              style: TextStyle(
//                color: Colors.green,
//                fontSize: 21,
//                fontWeight: FontWeight.bold,
//              ),
//            ),
//          ),
//        ),
//        Container(
//          height: (MediaQuery.of(context).size.height -
//                  appBar.preferredSize.height -
//                  MediaQuery.of(context).padding.top) *
//              0.5,
////            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
//          child: Column(
//            children: <Widget>[
////                SizedBox(
////                  height: 30,
////                ),
//              Expanded(
//                child: Container(
////                        decoration: BoxDecoration(
////                            borderRadius: BorderRadius.circular(10),
////                            color: Color(0xFFFDBA35),
////                            boxShadow: [
////                              BoxShadow(
////                                color: Color.fromRGBO(196, 135, 198, .3),
////                                blurRadius: 20,
////                                offset: Offset(0, 10),
////                              )
////                            ]),
//
//                    child: Form(
////                                  key: _formKey,
//                  child: SingleChildScrollView(
//                    child: Column(
//                      children: <Widget>[
//                        Container(
////                          padding: const EdgeInsets.all(10),
//                          decoration: BoxDecoration(
//                            border: Border(
//                              bottom: BorderSide(color: Colors.grey[200]),
//                            ),
//                          ),
//                          child: TextFormField(
//                            textInputAction: TextInputAction.next,
//                            onFieldSubmitted: (_) {
//                              FocusScope.of(context)
//                                  .requestFocus(_pwdFocusNode);
//                            },
//                            decoration: InputDecoration(
//                              border: InputBorder.none,
//                              hintText: getTranslated(context, 'email'),
//                              prefixIcon: Icon(
//                                Icons.email,
//                                color: Color.fromRGBO(1, 123, 126, 1),
//                              ),
//                              hintStyle: TextStyle(color: Colors.white),
//                            ),
//                            keyboardType: TextInputType.emailAddress,
//                            validator: (value) {
//                              bool emailValid = RegExp(
//                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                  .hasMatch(value);
//                              if (!emailValid) {
//                                bool spaceRex =
//                                    new RegExp(r"^\\s+$").hasMatch(value);
//                                if (spaceRex ||
//                                    value.length == 0 ||
//                                    value == null) {
//                                  return 'ادخل البريد الإلكتروني من فضلك';
//                                } else {
//                                  return 'البريد الإلكتروني غير صالح';
//                                }
//                              }
//                              return null;
//                            },
//                            onSaved: (value) {
////                                              _authData['email'] = value;
//                            },
//                          ),
//                        ),
////                                        if (_authMode == AuthMode.Login)
//                        Container(
////                          padding: const EdgeInsets.all(10),
//                          decoration: BoxDecoration(
//                            border: Border(
//                              bottom: BorderSide(color: Colors.grey[200]),
//                            ),
//                          ),
//                          child: TextFormField(
//                            focusNode: _pwdFocusNode,
//                            decoration: InputDecoration(
//                                border: InputBorder.none,
//                                hintText: getTranslated(context, 'password'),
//                                prefixIcon: Icon(
//                                  Icons.lock,
//                                  color: Color.fromRGBO(1, 123, 126, 1),
//                                ),
//                                hintStyle: TextStyle(color: Colors.white)),
//                            obscureText: true,
//                            controller: _passwordController,
//                            onSaved: (value) {
////                                              _authData['password'] = value;
//                            },
//                            validator: (value) {
//                              bool spaceRex =
//                                  new RegExp(r"^\\s+$").hasMatch(value);
//                              if (spaceRex ||
//                                  value.length == 0 ||
//                                  value == null) {
//                                return 'ادخل  كلمة المرور من فضلك';
//                              }
//                              return null;
//                            },
//                          ),
//                        ),
////                      SizedBox(
////                        height: (MediaQuery.of(context).size.height -
////                                appBar.preferredSize.height -
////                                MediaQuery.of(context).padding.top) *
////                            0.03,
////                      ),
//                        InkWell(
//                          onTap: () {
//                            print("Welcome to Hassab Labs");
//                          },
//                          child: Container(
////                        height: 45,
//                            margin: const EdgeInsets.symmetric(
//                              horizontal: 30,
//                            ),
//                            decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(50),
////                            color: Color.fromRGBO(49, 39, 79, 1),
//                              color: gridViewItemsColor,
//                            ),
//                            child: Center(
//                                child:
////                                                _submitLoading == false
//                                    Text(
//                              getTranslated(context, 'login_button_text'),
////                                                            : 'إرسال رابط تغيير كلمة المرور',
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontSize: 22,
//                                  fontWeight: FontWeight.bold),
//                            )
////                                                    : CircularProgressIndicator(
////                                                        backgroundColor:
////                                                            Colors.white,white
//                                ),
//                          ),
//                        ),
////                            Center(
////                                child:
//////                                                _submitLoading == false
////                                    Container(
////                              color: Color.fromRGBO(1, 123, 126, 1),
////                              child: RaisedButton(
////                                shape: RoundedRectangleBorder(
////                                  borderRadius: new BorderRadius.circular(30.0),
////                                  side: BorderSide(
//////                                      color: Color.fromRGBO(1, 123, 126, 1),
////                                      width: 2),
////                                ),
////                                child: Text(
////                                  getTranslated(context, 'login_button_text'),
//////                                                            : 'إرسال رابط تغيير كلمة المرور',
////                                  style: buttonTextStyle,
////                                ),
////                              ),
////                            )
//////                                                    : CircularProgressIndicator(
//////                                                        backgroundColor:
//////                                                            Colors.white,white
////                                ),
//                      ],
//                    ),
//                  ),
//                )),
//              ),
//            ],
//          ),
//        ),
//      ],
//    );
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
//      extendBodyBehindAppBar: true,
        appBar: appBar,
        backgroundColor: headerColour,
        body: isLandscape ? loginLandscape : loginPortrait);
  }
}

//import 'package:flutter/material.dart';
//import 'package:popularbrowser/constants.dart';
//import 'package:popularbrowser/localization/language_constants.dart';
//
////import '../arc_banner_image.dart';
//
//class LoginPage extends StatefulWidget {
//  @override
//  _LoginPageState createState() => _LoginPageState();
//}
//
//class _LoginPageState extends State<LoginPage> {
//  final _pwdFocusNode = FocusNode();
//
//  var _passwordController;
//
//  @override
//  Widget build(BuildContext context) {
////    final width = MediaQuery.of(context).size.width;
//    final appBar = AppBar(
//      backgroundColor: Color(0xFFFDBA35),
//      centerTitle: true,
//      title: Text(
//        getTranslated(context, 'login_button_text'),
//        style: TextStyle(
//            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
//        textAlign: TextAlign.center,
//      ),
//    );
//    final loginPortrait = Center(
//      child: ListView(
//        children: <Widget>[
//          Container(
//            padding: EdgeInsets.only(top: 10),
//            width: MediaQuery.of(context).size.width / 2,
//            height: (MediaQuery.of(context).size.height -
//                    appBar.preferredSize.height -
//                    MediaQuery.of(context).padding.top) *
//                0.3,
//            child: Image.asset(
//              'assets/icons/logo_home.png',
//            ),
//          ),
//          Container(
////            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
//            child: Center(
//              child: Text(
//                getTranslated(context, 'welcome'),
//                style: TextStyle(
//                  color: Colors.green,
//                  fontSize: 28,
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
//            ),
//          ),
//          Container(
////            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
//            child: Column(
//              children: <Widget>[
////                SizedBox(
////                  height: 30,
////                ),
//                Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisSize: MainAxisSize.max,
//                  children: <Widget>[
//                    Container(
////                        decoration: BoxDecoration(
////                            borderRadius: BorderRadius.circular(10),
////                            color: Color(0xFFFDBA35),
////                            boxShadow: [
////                              BoxShadow(
////                                color: Color.fromRGBO(196, 135, 198, .3),
////                                blurRadius: 20,
////                                offset: Offset(0, 10),
////                              )
////                            ]),
//                        child: Form(
////                                  key: _formKey,
//                      child: Padding(
//                        padding: const EdgeInsets.symmetric(
//                            vertical: 20, horizontal: 0),
//                        child: Column(
//                          children: <Widget>[
//                            Container(
//                              padding: const EdgeInsets.all(10),
//                              decoration: BoxDecoration(
//                                border: Border(
//                                  bottom: BorderSide(color: Colors.grey[200]),
//                                ),
//                              ),
//                              child: TextFormField(
//                                textInputAction: TextInputAction.next,
//                                onFieldSubmitted: (_) {
//                                  FocusScope.of(context)
//                                      .requestFocus(_pwdFocusNode);
//                                },
//                                decoration: InputDecoration(
//                                  border: InputBorder.none,
//                                  hintText: getTranslated(context, 'email'),
//                                  prefixIcon: Icon(
//                                    Icons.email,
//                                    color: Color.fromRGBO(1, 123, 126, 1),
//                                  ),
//                                  hintStyle: TextStyle(color: Colors.white),
//                                ),
//                                keyboardType: TextInputType.emailAddress,
//                                validator: (value) {
//                                  bool emailValid = RegExp(
//                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                      .hasMatch(value);
//                                  if (!emailValid) {
//                                    bool spaceRex =
//                                        new RegExp(r"^\\s+$").hasMatch(value);
//                                    if (spaceRex ||
//                                        value.length == 0 ||
//                                        value == null) {
//                                      return 'ادخل البريد الإلكتروني من فضلك';
//                                    } else {
//                                      return 'البريد الإلكتروني غير صالح';
//                                    }
//                                  }
//                                  return null;
//                                },
//                                onSaved: (value) {
////                                              _authData['email'] = value;
//                                },
//                              ),
//                            ),
////                                        if (_authMode == AuthMode.Login)
//                            Container(
//                              padding: const EdgeInsets.all(10),
//                              decoration: BoxDecoration(
//                                border: Border(
//                                  bottom: BorderSide(color: Colors.grey[200]),
//                                ),
//                              ),
//                              child: TextFormField(
//                                focusNode: _pwdFocusNode,
//                                decoration: InputDecoration(
//                                    border: InputBorder.none,
//                                    hintText:
//                                        getTranslated(context, 'password'),
//                                    prefixIcon: Icon(
//                                      Icons.lock,
//                                      color: Color.fromRGBO(1, 123, 126, 1),
//                                    ),
//                                    hintStyle: TextStyle(color: Colors.white)),
//                                obscureText: true,
//                                controller: _passwordController,
//                                onSaved: (value) {
////                                              _authData['password'] = value;
//                                },
//                                validator: (value) {
//                                  bool spaceRex =
//                                      new RegExp(r"^\\s+$").hasMatch(value);
//                                  if (spaceRex ||
//                                      value.length == 0 ||
//                                      value == null) {
//                                    return 'ادخل  كلمة المرور من فضلك';
//                                  }
//                                  return null;
//                                },
//                              ),
//                            ),
//                            SizedBox(
//                              height: 30,
//                            ),
//                            InkWell(
//                              onTap: () {
//                                print("Welcome to Hassab Labs");
//                              },
//                              child: Container(
//                                height: 45,
//                                margin: const EdgeInsets.symmetric(
//                                  horizontal: 30,
//                                ),
//                                decoration: BoxDecoration(
//                                  borderRadius: BorderRadius.circular(50),
////                            color: Color.fromRGBO(49, 39, 79, 1),
//                                  color: gridViewItemsColor,
//                                ),
//                                child: Center(
//                                    child:
////                                                _submitLoading == false
//                                        Text(
//                                  getTranslated(context, 'login_button_text'),
////                                                            : 'إرسال رابط تغيير كلمة المرور',
//                                  style: buttonTextStyle,
//                                )
////                                                    : CircularProgressIndicator(
////                                                        backgroundColor:
////                                                            Colors.white,white
//                                    ),
//                              ),
//                            ),
////                            Center(
////                                child:
//////                                                _submitLoading == false
////                                    Container(
////                              color: Color.fromRGBO(1, 123, 126, 1),
////                              child: RaisedButton(
////                                shape: RoundedRectangleBorder(
////                                  borderRadius: new BorderRadius.circular(30.0),
////                                  side: BorderSide(
//////                                      color: Color.fromRGBO(1, 123, 126, 1),
////                                      width: 2),
////                                ),
////                                child: Text(
////                                  getTranslated(context, 'login_button_text'),
//////                                                            : 'إرسال رابط تغيير كلمة المرور',
////                                  style: buttonTextStyle,
////                                ),
////                              ),
////                            )
//////                                                    : CircularProgressIndicator(
//////                                                        backgroundColor:
//////                                                            Colors.white,white
////                                ),
//                          ],
//                        ),
//                      ),
//                    ))
//                  ],
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//    final loginLandscape = ListView(
//      children: <Widget>[
//        Container(
//          padding: EdgeInsets.only(top: 10),
////          width: MediaQuery.of(context).size.,
//          height: (MediaQuery.of(context).size.height -
//                  appBar.preferredSize.height -
//                  MediaQuery.of(context).padding.top) *
//              0.3,
//          child: Image.asset(
//            'assets/icons/logo_home.png',
//          ),
//        ),
//        Container(
//          height: (MediaQuery.of(context).size.height -
//                  appBar.preferredSize.height -
//                  MediaQuery.of(context).padding.top) *
//              0.1,
////            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
//          child: Center(
//            child: Text(
//              getTranslated(context, 'welcome'),
//              style: TextStyle(
//                color: Colors.green,
//                fontSize: 21,
//                fontWeight: FontWeight.bold,
//              ),
//            ),
//          ),
//        ),
//        Container(
//          height: (MediaQuery.of(context).size.height -
//                  appBar.preferredSize.height -
//                  MediaQuery.of(context).padding.top) *
//              0.55,
////            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
//          child: Column(
//            children: <Widget>[
////                SizedBox(
////                  height: 30,
////                ),
//              Container(
////                        decoration: BoxDecoration(
////                            borderRadius: BorderRadius.circular(10),
////                            color: Color(0xFFFDBA35),
////                            boxShadow: [
////                              BoxShadow(
////                                color: Color.fromRGBO(196, 135, 198, .3),
////                                blurRadius: 20,
////                                offset: Offset(0, 10),
////                              )
////                            ]),
//
//                  child: Form(
////                                  key: _formKey,
//                child: SingleChildScrollView(
//                  child: Column(
//                    children: <Widget>[
//                      Container(
////                          padding: const EdgeInsets.all(10),
//                        decoration: BoxDecoration(
//                          border: Border(
//                            bottom: BorderSide(color: Colors.grey[200]),
//                          ),
//                        ),
//                        child: TextFormField(
//                          textInputAction: TextInputAction.next,
//                          onFieldSubmitted: (_) {
//                            FocusScope.of(context).requestFocus(_pwdFocusNode);
//                          },
//                          decoration: InputDecoration(
//                            border: InputBorder.none,
//                            hintText: getTranslated(context, 'email'),
//                            prefixIcon: Icon(
//                              Icons.email,
//                              color: Color.fromRGBO(1, 123, 126, 1),
//                            ),
//                            hintStyle: TextStyle(color: Colors.white),
//                          ),
//                          keyboardType: TextInputType.emailAddress,
//                          validator: (value) {
//                            bool emailValid = RegExp(
//                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                .hasMatch(value);
//                            if (!emailValid) {
//                              bool spaceRex =
//                                  new RegExp(r"^\\s+$").hasMatch(value);
//                              if (spaceRex ||
//                                  value.length == 0 ||
//                                  value == null) {
//                                return 'ادخل البريد الإلكتروني من فضلك';
//                              } else {
//                                return 'البريد الإلكتروني غير صالح';
//                              }
//                            }
//                            return null;
//                          },
//                          onSaved: (value) {
////                                              _authData['email'] = value;
//                          },
//                        ),
//                      ),
////                                        if (_authMode == AuthMode.Login)
//                      Container(
////                          padding: const EdgeInsets.all(10),
//                        decoration: BoxDecoration(
//                          border: Border(
//                            bottom: BorderSide(color: Colors.grey[200]),
//                          ),
//                        ),
//                        child: TextFormField(
//                          focusNode: _pwdFocusNode,
//                          decoration: InputDecoration(
//                              border: InputBorder.none,
//                              hintText: getTranslated(context, 'password'),
//                              prefixIcon: Icon(
//                                Icons.lock,
//                                color: Color.fromRGBO(1, 123, 126, 1),
//                              ),
//                              hintStyle: TextStyle(color: Colors.white)),
//                          obscureText: true,
//                          controller: _passwordController,
//                          onSaved: (value) {
////                                              _authData['password'] = value;
//                          },
//                          validator: (value) {
//                            bool spaceRex =
//                                new RegExp(r"^\\s+$").hasMatch(value);
//                            if (spaceRex ||
//                                value.length == 0 ||
//                                value == null) {
//                              return 'ادخل  كلمة المرور من فضلك';
//                            }
//                            return null;
//                          },
//                        ),
//                      ),
//                      SizedBox(
//                        height: (MediaQuery.of(context).size.height -
//                                appBar.preferredSize.height -
//                                MediaQuery.of(context).padding.top) *
//                            0.03,
//                      ),
//                      InkWell(
//                        onTap: () {
//                          print("Welcome to Hassab Labs");
//                        },
//                        child: Container(
////                        height: 45,
//                          margin: const EdgeInsets.symmetric(
//                            horizontal: 30,
//                          ),
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(50),
////                            color: Color.fromRGBO(49, 39, 79, 1),
//                            color: gridViewItemsColor,
//                          ),
//                          child: Center(
//                              child:
////                                                _submitLoading == false
//                                  Text(
//                            getTranslated(context, 'login_button_text'),
////                                                            : 'إرسال رابط تغيير كلمة المرور',
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontSize: 22,
//                                fontWeight: FontWeight.bold),
//                          )
////                                                    : CircularProgressIndicator(
////                                                        backgroundColor:
////                                                            Colors.white,white
//                              ),
//                        ),
//                      ),
////                            Center(
////                                child:
//////                                                _submitLoading == false
////                                    Container(
////                              color: Color.fromRGBO(1, 123, 126, 1),
////                              child: RaisedButton(
////                                shape: RoundedRectangleBorder(
////                                  borderRadius: new BorderRadius.circular(30.0),
////                                  side: BorderSide(
//////                                      color: Color.fromRGBO(1, 123, 126, 1),
////                                      width: 2),
////                                ),
////                                child: Text(
////                                  getTranslated(context, 'login_button_text'),
//////                                                            : 'إرسال رابط تغيير كلمة المرور',
////                                  style: buttonTextStyle,
////                                ),
////                              ),
////                            )
//////                                                    : CircularProgressIndicator(
//////                                                        backgroundColor:
//////                                                            Colors.white,white
////                                ),
//                    ],
//                  ),
//                ),
//              )),
//            ],
//          ),
//        ),
//      ],
//    );
//    final isLandscape =
//        MediaQuery.of(context).orientation == Orientation.landscape;
//    return Scaffold(
////      extendBodyBehindAppBar: true,
//        appBar: appBar,
//        backgroundColor: headerColour,
//        body: isLandscape ? loginLandscape : loginPortrait);
//  }
//}
