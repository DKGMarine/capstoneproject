import 'package:flutter/material.dart';
import '../screens/groups_screen.dart';
import '../color/colors.dart';
import '../screens/inventory_screen.dart';
import '../screens/events_screen.dart';
import '../screens/calendar_screen.dart';
import '../screens/settings_screen.dart';

class MyDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, ImageProvider<dynamic> image, Function tapHandler) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.primaryText,
        ),
      ),
      leading: ImageIcon(
        image,
        color: AppColors.secondaryElement,
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          buildListTile(
              'Scouts', AssetImage('assets/images/icon-customers.png'), () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(GroupsScreen.routeName);
          }),
          buildListTile(
              'Inventory', AssetImage('assets/images/icon-products.png'), () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(InventoryScreen.routeName);
          }),
          buildListTile('Events', AssetImage('assets/images/icon-invoices.png'), () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(EventScreen.routeName);
          }),
          buildListTile(
              'Calendar', AssetImage('assets/images/icon-calendar.png'), () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(CalendarScreen.routeName);
          }),
          buildListTile(
              'Settings', AssetImage('assets/images/icon-setting.png'), () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(SettingsScreen.routeName);
          }),
        ],
      ),
    );
  }
}
