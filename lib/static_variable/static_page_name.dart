import 'package:flutter/material.dart';
import 'package:newcareyou/main.dart';
import 'package:newcareyou/screen/index_screen.dart';
import 'package:newcareyou/screen/main_screen/main_screen.dart';

class StaticPageName {
  Future<Map> routesName() async {
    Map<String, WidgetBuilder> mapRoutes = {
      firstPage: (context) => MyHomePage(),
      indexPage: (context) => IndexScreen(),
    };
    return mapRoutes;
  }

  static String firstPage = 'First';
  static String indexPage = 'HomeScreen';
}

class StaticPageMainMenu {
  Future<List> listPage() async {
    List list = [
      Page1(),
      Page2(),
      Page3(),
      Page4(),
    ];
    return list;
  }
}
