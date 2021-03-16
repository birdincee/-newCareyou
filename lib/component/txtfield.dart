import 'package:flutter/material.dart';
import 'package:newcareyou/static_variable/static_bool.dart';
import 'package:newcareyou/static_variable/theme_data.dart';

class TextBox extends StatelessWidget {
  final bool checkTheme;

  const TextBox({Key key, this.checkTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: checkTheme
          ? StaticTheme.decorationDarkTheme
          : StaticTheme.decorationLightTheme,
    );
  }
}
