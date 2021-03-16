import 'package:flutter/material.dart';
import 'package:newcareyou/main.dart';
import 'package:newcareyou/screen/home_screen.dart';
class StaticPageName{

 Future<Map> routesName()async{
   Map<String, WidgetBuilder> mapRoutes ={
     firstPage : (context) => MyHomePage(),
     homePage : (context) => HomeScreen(),
   };
   return mapRoutes;
 }

 static String firstPage = 'First';
 static String homePage = 'HomeScreen';
}