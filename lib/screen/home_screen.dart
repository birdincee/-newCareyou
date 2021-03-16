import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:newcareyou/component/endDrawer_menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<IconData> iconList = [
    Icons.expand,
    Icons.expand,
  ];
  int _bottomNavIndex = 0;

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
          floatingActionButton: FloatingActionButton(
              //params
              ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: iconList,
            activeIndex: _bottomNavIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.smoothEdge,
            onTap: (index) => setState(() => _bottomNavIndex = index),
            //other params
          ),
        ),
      ),
    );
  }
}
