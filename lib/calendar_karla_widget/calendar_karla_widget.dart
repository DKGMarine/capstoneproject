
/*
*  calendar_karla_widget.dart
*  ScoutBoard
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:capstoneproject/side_bar_weston3_widget/side_bar_weston3_widget.dart';
import 'package:capstoneproject/styles/style.dart';
import 'package:capstoneproject/values/values.dart';
import 'package:table_calendar/table_calendar.dart';

import '../styles/style.dart';

class CalendarKarlaWidget extends StatefulWidget {
  
  @override
  _CalendarKarlaWidgetState createState() => _CalendarKarlaWidgetState();

}
class _CalendarKarlaWidgetState extends State<CalendarKarlaWidget>{
  void onBackwardArrowPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => SideBarWeston3Widget()));
  
  CalendarController _controller;
  @override
  void initState(){
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 73, 100),
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.only(left: 0, top: 40, right: 2, bottom: 430),
        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             Expanded(
              child: FlatButton(
              onPressed: () => this.onBackwardArrowPressed(context),
              color: Color.fromARGB(0, 0, 0, 0),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
           ),
          textColor: Color.fromARGB(255, 0, 0, 0),
          padding: EdgeInsets.only(left: 0, top: 0, right: 350, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/backward-arrow.png",),
              SizedBox(
                width: 3,
              ),
              Text(
                "",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              )
            ],
          )
        ),
             ),
             TableCalendar(calendarController: _controller,)
            ],
          )
       
      )
    
    );
  }
}

