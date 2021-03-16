import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newcareyou/sharedPreferences/shared_string_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FnDefault {
  Future<bool> checkBoolTheme() async {
    bool bCheckTheme = false;
    AdaptiveThemeMode adaptiveTheme;
    adaptiveTheme = await AdaptiveTheme.getThemeMode();
    if (adaptiveTheme.isDark) {
      bCheckTheme = true;
    } else if (adaptiveTheme.isLight) {
      bCheckTheme = false;
    } else {}
    return bCheckTheme;
  }

  Future<dynamic> checkLogin() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    bool boolValue = prefs.getBool(SharedStringKey.sCheckLogin);
    if (boolValue != null) {
      return boolValue;
    } else {
      Future<bool> boolDefault =
          prefs.setBool(SharedStringKey.sCheckLogin, false);
      boolValue = await boolDefault;
      return boolValue;
    }
  }

  Future<bool> setCheckLogin() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    Future<bool> bCheckLogin = prefs.setBool(SharedStringKey.sCheckLogin, true);
    // final bool bValue = await bCheckLogin;
    return bCheckLogin;
  }
}
