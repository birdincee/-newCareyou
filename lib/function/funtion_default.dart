import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
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

  //lib Location
  Location location = new Location();

  Future<bool> requestServiceLocation() async {
    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        _serviceEnabled = true;
      }
    }
    return _serviceEnabled;
  }

  Future<PermissionStatus> requestLocationPermission() async {
    PermissionStatus _permissionGranted;
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return _permissionGranted;
      }
    }
    return _permissionGranted;
  }

  Future<LocationData> getCurrentLocation() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        // Permission denied
      }
      return null;
    }
  }

//
}
