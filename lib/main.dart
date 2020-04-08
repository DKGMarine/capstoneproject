import 'package:flutter/material.dart';
import './screens/calendar_screen.dart';
import './screens/events_screen.dart';
import './screens/groups_screen.dart';
import './screens/inventory_screen.dart';
import './screens/login_screen.dart';
import './screens/registration_screen.dart';
import './screens/settings_screen.dart';
import './color/colors.dart';
import './screens/dashboard_screen.dart';
//import './tabs_screen.dart';


void main() => runApp(MyApp());

//creates custom color for the materail theme useing HEX value and RGBO values below
//----------------------------------------------------------
MaterialColor colorCustom = MaterialColor(0xFF284964, color);
Map<int, Color> color = {
  50: Color.fromRGBO(40, 73, 100, .1),
  100: Color.fromRGBO(40, 73, 100, .2),
  200: Color.fromRGBO(40, 73, 100, .3),
  300: Color.fromRGBO(40, 73, 100, .4),
  400: Color.fromRGBO(40, 73, 100, .5),
  500: Color.fromRGBO(40, 73, 100, .6),
  600: Color.fromRGBO(40, 73, 100, .7),
  700: Color.fromRGBO(40, 73, 100, .8),
  800: Color.fromRGBO(40, 73, 100, .9),
  900: Color.fromRGBO(40, 73, 100, 1),
};
//----------------------------------------------------------

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scoutboard',
      theme: ThemeData(
        primarySwatch: colorCustom,
        canvasColor: colorCustom,
        accentColor: AppColors.secondaryElement,
        fontFamily: 'SourceSansPro',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: AppColors.primaryText),
            title: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24,
              fontFamily: 'Ubuntu',
            )),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => DashboardScreen(),
       LoginScreen.routeName: (ctx) => LoginScreen(),
       RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
       GroupsScreen.routeName: (ctx) => GroupsScreen(),
       EventsScreen.routeName: (ctx) => EventsScreen(),
       InventoryScreen.routeName: (ctx) => InventoryScreen(),
       SettingsScreen.routeName: (ctx) => SettingsScreen(),
       CalendarScreen.routeName: (ctx) => CalendarScreen(),
      },
    );
  }
}
