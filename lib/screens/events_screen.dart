import 'package:flutter/material.dart';
import '../widgets/new_event.dart';
import '../widgets/event_list.dart';
import '../models/event.dart';
import '../styles/style.dart';
import '../values/values.dart';
import 'package:scoutboard/widgets/globals.dart' as global;
import 'package:http/http.dart' as http;
import 'dart:convert';

/*
RETRIEVING FUNDRAISER GROUPS/TEAMS

Page: '/fundraiserGroups'

'ID':
*/

/*
ADDING FUNDRAISER GROUPS/TEAMS

Page: '/addFundraiserGroup'

'ScoutID': "24678",
'MoneyRaised': "0",
'Name': "Weston",
'NumberOfTeams': "50", // !!number of teams is temporary!!
'StartDate': "10/02/1990",
'EndDate': "Never",
'TargetGoal': "50",
'Location': "Walmart",
'Time': "12:00AM"

*/

/*
DELETING FUNDRAISER GROUPS/TEAMS

Page: '/deletefundraiser'

'ID':
*/

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

  ID = '25275';
  final http.Response response = await http.post(
      'https://capstoneproject-271322.appspot.com/fundraiserGroups', // change this to what page you are requesting data from

      body:

      {
        'ID': ID,
      }

  );


  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.

    print(json.decode(response.body));
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

class EventScreen extends StatefulWidget {
  static const routeName = '/events-screen';
  // String titleInput;
  // String amountInput;
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  Future<Album> futureAlbum;
  final List<Event> _userEvent = [

  ];

  void _addNewEvent(String eventName, String eventNumOfTeams, String eventStartDate, String eventEndDate, String eventTargetGoal, String eventLocation, String eventTime) {
    final newEvent = Event(
      name: eventName,
      numberOfTeams: eventNumOfTeams,
      startDate: eventStartDate,
      endDate: eventEndDate,
      targetGoal: eventTargetGoal,
      location: eventLocation,
      time: eventTime,
      id: DateTime.now().toString(),
    );





    setState(() {
      _userEvent.add(newEvent);
    });
  }

  void _startAddNewEvent(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Color.fromRGBO(255, 0, 0, 0.0),
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewEvent(_addNewEvent),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteEvent(String id) {
    setState(() {
      _userEvent.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Events',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewEvent(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              EventList(_userEvent, _deleteEvent),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewEvent(context),
      ),
    );
  }
}