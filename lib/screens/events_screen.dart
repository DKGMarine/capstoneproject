import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  static const routeName = '/events-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Events'),
      ),
      body: Center(
        child: Text(
          'The Events Page!',
        ),
      ),
    );
  }
}