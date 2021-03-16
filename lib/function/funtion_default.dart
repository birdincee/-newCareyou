import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

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
}
