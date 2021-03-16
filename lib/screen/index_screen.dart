import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:newcareyou/component/endDrawer_menu.dart';
import 'package:newcareyou/component/willpopCallBack.dart';
import 'package:newcareyou/static_variable/static_page_name.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _bottomNavIndex;

  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.home,
    Icons.brightness_4,
    Icons.brightness_6,
    Icons.brightness_7,
  ];

  List listPage = [];

  void navigatorPage(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  Future<bool> loadList() async {
    listPage = await StaticPageMainMenu().listPage();
    print(listPage);
    return true;
  }

  @override
  void initState() {
    _bottomNavIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => WillCall().willPopCallback(),
      child: SafeArea(
        child: AnimatedTheme(
          duration: Duration(milliseconds: 500),
          data: Theme.of(context),
          child: Scaffold(
            appBar: AppBar(),
            endDrawer: EndDrawerMenu(),
            body: FutureBuilder(
              future: loadList(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return listPage[_bottomNavIndex];
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            floatingActionButton: FloatingActionButton(
              elevation: 8,
              child: Icon(
                Icons.brightness_3,
              ),
              onPressed: () {
                _animationController.reset();
                _animationController.forward();
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar.builder(
              itemCount: iconList.length,
              tabBuilder: (int index, bool isActive) {
                final color = isActive ? Colors.purple : Colors.black;
                return Icon(
                  iconList[index],
                  size: 24,
                  color: color,
                );
              },
              activeIndex: _bottomNavIndex,
              notchAndCornersAnimation: animation,
              splashSpeedInMilliseconds: 500,
              notchSmoothness: NotchSmoothness.defaultEdge,
              gapLocation: GapLocation.center,
              // leftCornerRadius: 32,
              // rightCornerRadius: 32,
              onTap: (index) => navigatorPage(index),
            ),
          ),
        ),
      ),
    );
  }
}
