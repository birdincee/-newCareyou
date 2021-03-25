import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:location/location.dart';
import 'package:newcareyou/component/txtfield.dart';
import 'package:newcareyou/component/willpopCallBack.dart';
import 'package:newcareyou/function/funtion_default.dart';
import 'package:newcareyou/screen/index_screen.dart';
import 'package:newcareyou/static_variable/static_bool.dart';
import 'package:newcareyou/static_variable/static_object.dart';
import 'package:newcareyou/static_variable/static_page_name.dart';
import 'package:newcareyou/static_variable/theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // ดึงค่า Theme
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  //
  final pageRoute =
      await StaticPageName().routesName(); // ดึงค่า ชื่อ RoutePage
  StaticBool.bCheckLogin =
      await FnDefault().checkLogin(); // ดึงค่าเช็คว่าเคย Login แล้วหรือยัง
  StaticBool.bCheckTheme = await FnDefault().checkBoolTheme();
  print("bCheckTheme :" + StaticBool.bCheckTheme.toString());
  //location
  bool _serviceEnabled =
      await FnDefault().requestServiceLocation(); // เช็ค ServiceLocation
  print("serviceEnabled " + " $_serviceEnabled");
  PermissionStatus _permissionGranted =
      await FnDefault().requestLocationPermission(); // เช็ค PermissionLocation
  print("PermissionStatus " + " $_permissionGranted");
  StaticLocation.currentLocation =
      await FnDefault().getCurrentLocation(); // ดึงค่า Location ปัจจุบัน
  if (StaticLocation.currentLocation != null) {
    StaticLocation.myLatitude =
        StaticLocation.currentLocation.latitude; // set ค่า lat
    StaticLocation.myLongitude =
        StaticLocation.currentLocation.longitude; // set ค่า long
    print("Lat :" +
        StaticLocation.myLatitude.toString() +
        " Long :" +
        StaticLocation.myLongitude.toString());
  }
  //
  print("bCheckLogin " + StaticBool.bCheckLogin.toString());
  runApp(
    MyApp(
      savedThemeMode: savedThemeMode,
      pageRoute: pageRoute,
      bCheckLogin: StaticBool.bCheckLogin,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode savedThemeMode;
  final dynamic pageRoute;
  final bool bCheckLogin;

  const MyApp({Key key, this.savedThemeMode, this.pageRoute, this.bCheckLogin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: StaticTheme.lightTheme,
      dark: StaticTheme.darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute:
            // !bCheckLogin ? StaticPageName.firstPage : StaticPageName.indexPage,
            StaticPageName.firstPage,
        routes: pageRoute,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  AnimationController animationController;
  Animation<double> _animation;

  singIn() async {
    StaticBool.bCheckLogin = await FnDefault().setCheckLogin();
    await FnDefault().createAccount();
    if (StaticBool.bCheckLogin) {
      await Navigator.pushReplacementNamed(context, StaticPageName.indexPage);
      print(StaticBool.bCheckLogin);
    }
  }



  @override
  void initState() {
    animationController = AnimationController(duration: Duration(milliseconds: 800,),vsync: this,);
    _animation  = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn,);
    animationController.forward();
    super.initState();
  }
  
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 300),
      data: Theme.of(context),
      child: WillPopScope(
        onWillPop: () => WillCall().willPopCallback(),
        child: SafeArea(
          child: Scaffold(
            body: SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  // Text(
                  //   'CareYou',
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //     letterSpacing: 0.8,
                  //   ),
                  // ),
                  ScaleTransition(
                    scale: _animation,
                    child: Image.asset("assets/images/logo.png",
                      width: 250,
                      height: 250,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  TextBox(
                    checkTheme: StaticBool.bCheckTheme,
                  ),
                  ElevatedButton(
                    onPressed: singIn,
                    child: Text('Singin'),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
