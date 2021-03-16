import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newcareyou/function/funtion_default.dart';
import 'package:newcareyou/static_variable/static_bool.dart';

class EndDrawerMenu extends StatefulWidget {
  @override
  _EndDrawerMenuState createState() => _EndDrawerMenuState();
}

class _EndDrawerMenuState extends State<EndDrawerMenu> {
  EdgeInsets ePadMenu = EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5);

  _checkDefaultTheme() async {
    StaticBool.bCheckTheme = await FnDefault().checkBoolTheme();
    print(StaticBool.bCheckTheme);
    setState(() {});
  }

  _checkSwitchTheme(bool toggle, BuildContext context) async {
    dynamic msg = '';
    setState(() {
      StaticBool.bCheckTheme = toggle;
      if (StaticBool.bCheckTheme) {
        AdaptiveTheme.of(context).setDark();
        msg = 'Dark';
      } else {
        AdaptiveTheme.of(context).setLight();
        msg = 'Light';
      }
    });
    print('Theme = $msg');
  }

  @override
  void initState() {
    _checkDefaultTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('data'),
            accountEmail: Text('data'),
          ),
          Padding(
            padding: ePadMenu,
            child: Row(
              children: [
                Icon(Icons.wb_sunny),
                Switch(
                  value: StaticBool.bCheckTheme,
                  onChanged: (toggle) => _checkSwitchTheme(toggle, context),
                ),
                Icon(Icons.nightlight_round),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
