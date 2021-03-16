import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newcareyou/screen/home_screen.dart';
import 'package:newcareyou/static_variable/static_page_name.dart';
import 'package:newcareyou/static_variable/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  final pageRoute = await StaticPageName().routesName();
  runApp(
      MyApp(
        savedThemeMode: savedThemeMode,
        pageRoute: pageRoute,
      ),
  );
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode savedThemeMode;
  final dynamic pageRoute;
  const MyApp({Key key, this.savedThemeMode, this.pageRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: StaticTheme.lightTheme,
      dark: StaticTheme.darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Adaptive Theme Demo',
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: StaticPageName.firstPage,
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 300),
      data: Theme.of(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Adaptive Theme Demo'),
        ),
        body: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                'Current Theme Mode',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 0.8,
                ),
              ),
              Text(
                AdaptiveTheme.of(context).mode.name.toUpperCase(),
                style: TextStyle(
                  fontSize: 24,
                  height: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  AdaptiveTheme.of(context).toggleThemeMode();
                },
                child: Text('Toggle Theme Mode'),
              ),
              ElevatedButton(
                onPressed: () {
                  AdaptiveTheme.of(context).setDark();
                },
                child: Text('Set Dark'),
              ),
              ElevatedButton(
                onPressed: () {
                  AdaptiveTheme.of(context).setLight();
                },
                child: Text('set Light'),
              ),
              ElevatedButton(
                onPressed: () {
                  AdaptiveTheme.of(context).setSystem();
                },
                child: Text('Set System Default'),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'HomeScreen');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
