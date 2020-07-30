import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  final String myKey = 'AIzaSyALv7hZQYwXCLLKxR1T1WgVZUlEeHPYCTw';

  Future<String> _authenticate(
      String email, String password, String urlSegment) async {
    String localId;
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=$myKey';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);

      localId = responseData['localId'];

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
    return localId;
  }

  Future<String> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<String> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
