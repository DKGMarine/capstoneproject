import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Settings'),
      ),
      body: Center(
        child: Text(
          'The Settings Page!',
        ),
      ),
    );
  }
}
