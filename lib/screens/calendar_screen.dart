import 'package:flutter/material.dart';
import '../styles/style.dart';
import '../values/values.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarScreen extends StatefulWidget {
  static const routeName = '/calendar-screen';
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();

}
class _CalendarWidgetState extends State<CalendarScreen>{
  
  
  CalendarController _controller;
  @override
  void initState(){
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Calendar'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.only(left: 0, top: 40, right: 2, bottom: 430),
        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             
             TableCalendar(calendarController: _controller,)
            ],
          )
       
      )
    );
  }
}

