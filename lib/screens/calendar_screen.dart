import 'package:flutter/material.dart';
import '../styles/style.dart';
import '../values/values.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:scoutboard/widgets/globals.dart' as global;
import 'package:http/http.dart' as http;
import 'dart:convert';


class Album{ // change this to parse what data you need

  final int ID;
  Album({this.ID});

  factory Album.fromJson(Map<String, dynamic> json){

    return Album(
      ID: json['ID'],
    );


  }
}



Future<Album> createAlbum(String ID) async {

  final http.Response response = await http.post(
      'https://scoutboard.appspot.com/login', // change this to what page you are requesting data from

      body:

      {
        'ID': ID,
      }

  );


  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.

    try{
      return Album.fromJson(json.decode(response.body));
    }catch(err) {
      print("Error in returning album");
      return null;
    }
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class CalendarScreen extends StatefulWidget {
  static const routeName = '/calendar-screen';
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();

}
class _CalendarWidgetState extends State<CalendarScreen>{
  Future<Album> futureAlbum;
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
        padding: EdgeInsets.only(left: 0, top: 40, right: 2, bottom: 100),
        
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

