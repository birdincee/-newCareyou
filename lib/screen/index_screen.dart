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

  List<BottomNavigationBarItem> listIcon = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
        activeIcon: Icon(Icons.home_rounded),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.supervised_user_circle),
      label: "User",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.supervised_user_circle),
      label: "User",
    ),
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
            extendBody: true,
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
            bottomNavigationBar: tapBottomBar(),
          ),
        ),
      ),
    );
  }

  Widget tapBottomBar(){
    return BottomNavigationBar(
        items: listIcon,
        currentIndex: _bottomNavIndex,
        selectedItemColor: Colors.purple,
        onTap: (int i) => navigatorPage(i),
    );
  }

}
