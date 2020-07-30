import 'package:flutter/material.dart';
import 'package:popularbrowser/localization/demo_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:pop/localization/demo_localization.dart';

const String LANGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String ARABIC = 'ar';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? 'ar';
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temp;

  switch (languageCode) {
    case ENGLISH:
      _temp = Locale(languageCode, 'US');
      break;
    case ARABIC:
      _temp = Locale(languageCode, 'EG');
      break;
    default:
      _temp = Locale(languageCode, 'EG');
  }
  return _temp;
}

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).translate(key);
}
