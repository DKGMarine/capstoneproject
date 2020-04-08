import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  static const routeName = '/calendar-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Calendar'),
      ),
      body: Center(
        child: Text(
          'The Calendar Page!',
        ),
      ),
    );
  }
}
