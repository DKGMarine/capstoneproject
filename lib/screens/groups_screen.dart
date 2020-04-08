import 'package:flutter/material.dart';

class GroupsScreen extends StatelessWidget {
  static const routeName = '/groups-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Groups'),
      ),
      body: Center(
        child: Text(
          'The Groups Page!',
        ),
      ),
    );
  }
}