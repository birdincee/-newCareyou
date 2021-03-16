import 'package:flutter/material.dart';
import 'package:newcareyou/component/endDrawer_menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 500),
      data: Theme.of(context),
      curve: Curves.easeInOut,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          endDrawer: EndDrawerMenu(),
        ),
      ),
    );
  }
}
