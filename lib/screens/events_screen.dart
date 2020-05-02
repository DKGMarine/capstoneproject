import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/event.dart';
import '../screens/dashboard_screen.dart';
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


MoneyRaised = request.form.get('MoneyRaised')
    Name = request.form.get('Name')
    Number_of_teams = request.form.get('NumberOfTeams')
    Start_Date = request.form.get('StartDate')
    EndDate = request.form.get('EndDate')
    TargetGoal = request.form.get('TargetGoal')
    ScoutID = request.form.get('ScoutID')
    Location = request.form.get('Location')
    Time = request.form.get('Time')
*/

class Album {
  // change this to parse what data you need

  final String name;
  final String numOfTeams;
  final String startDate;
  final String endDate;
  final String targetGoal;
  final String location;
  final String time;
  final String moneyRaised;
  final String scoutID;
  Album(
      {this.name,
      this.numOfTeams,
      this.startDate,
      this.endDate,
      this.targetGoal,
      this.location,
      this.time,
      this.moneyRaised,
      this.scoutID});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['Name'],
      numOfTeams: json['NumberOfTeams'],
      startDate: json['StartDate'],
      endDate: json['EndDate'],
      targetGoal: json['TargetGoal'],
      location: json['Location'],
      time: json['Time'],
      moneyRaised: json['MoneyRaised'],
      scoutID: json['ScoutID'],
    );
  }
}

List<Album> parseAlbums(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
}

Future<List<Album>> createAlbum(String id) async {
  final http.Response response = await http.post(
      'https://scoutboard.appspot.com/fundraiserGroups', // change this to what page you are requesting data from

      body: {
        'ID': id,
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.

    print(json.decode(response.body));
    try {
      return compute(parseAlbums, response.body);
    } catch (err) {
      print("Error in returning album");
      return null;
    }
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future addAlbum(
    String name,
    String numOfTeams,
    String startDate,
    String endDate,
    String targetGoal,
    String location,
    String time,
    String moneyRaised,
    String id) async {
  
  final http.Response response = await http.post(
      'https://scoutboard.appspot.com/addFundraiserGroup', // change this to what page you are requesting data from

      body: {
        'Name': name,
        'NumberOfTeams': numOfTeams,
        'StartDate': startDate,
        'EndDate': endDate,
        'TargetGoal': targetGoal,
        'Location': location,
        'Time': time,
        'MoneyRaised': moneyRaised,
        'ScoutID': id,
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.

    print('1');
    print(json.decode(response.body));
    return response.body;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Album> deleteAlbum(String id) async {
  final http.Response response = await http.post(
      'https://scoutboard.appspot.com/deletefundraiser', // change this to what page you are requesting data from

      body: {
        'ID': id,
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    print(json.decode(response.body));
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to delete album');
  }
}

class EventScreen extends StatefulWidget {
  static const routeName = '/events-screen';
  EventScreen({Key key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  void _startAddNewEvent(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Color.fromRGBO(255, 0, 0, 0.0),
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewEvent(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(StatefulWidgetReg.routeName);
            }),
        elevation: 0,
        title: Text(
          'Events',
        ),
      ),
      body: FutureBuilder<List<Album>>(
          future: createAlbum(global.userID),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          EventList(
                            futureAlbum: snapshot.data,
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(child: CircularProgressIndicator());
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _startAddNewEvent(context);
            });
          }),
    );
  }
}

class EventList extends StatefulWidget {
  static const routeName = '/events-screen';
  final List<Album> futureAlbum;

  EventList({Key key, this.futureAlbum}) : super(key: key);

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: widget.futureAlbum.isEmpty
          ? Container(
              alignment: Alignment(0.0, -0.3),
              child: Text(
                'No event added yet!',
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              ))
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Colors.blueGrey,
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: ListTile(
                      leading: Column(),
                      title: Text(widget.futureAlbum[index].name,
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.primaryText,
                          )),
                      subtitle: Text(widget.futureAlbum[index].startDate,
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.primaryText,
                          )),
                      trailing: Column(
                        children: <Widget>[
                          SizedBox(height: 4),
                        
                        ],
                      ),
                    ),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {
                            deleteAlbum(widget.futureAlbum[index].scoutID).then((futureAlbum) {
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .pushNamed(EventList.routeName);
                            }
                            ).catchError((e) {

                            });
                          }),
                    ],
                  ),
                );
              },
              itemCount: widget.futureAlbum.length,
            ),
    );
  }
}

class NewEvent extends StatefulWidget {
 
  @override
  _NewEventState createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  final _nameController = TextEditingController();
  final _numberOfTeamsController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _targetGoalController = TextEditingController();
  final _locationController = TextEditingController();
  final _timeController = TextEditingController();
  final _moneyRaisedController = TextEditingController();

  void _submitData() {
    if (_nameController.text.isEmpty) {
      return;
    }
    final enteredName = _nameController.text;
    final enteredNumberOfTeams = _numberOfTeamsController.text;
    final enteredStartDate = _startDateController.text;
    final enteredEndDate = _endDateController.text;
    final enteredTargetGoal = _targetGoalController.text;
    final enteredLocation = _locationController.text;
    final enteredTime = _timeController.text;
    final moneyRaised = _moneyRaisedController.text;

    if (enteredName.isEmpty ||
        enteredNumberOfTeams.isEmpty ||
        enteredStartDate.isEmpty ||
        enteredEndDate.isEmpty ||
        enteredTargetGoal.isEmpty ||
        enteredLocation.isEmpty  ||
        moneyRaised.isEmpty) {
      return;
    }




    print(enteredName);
    print(enteredLocation);
    print(enteredNumberOfTeams);
    String response;
    addAlbum(enteredName, enteredNumberOfTeams, enteredStartDate, enteredEndDate,enteredTargetGoal, enteredLocation,enteredTime, moneyRaised, global.userID)
        .then((response) {
      print('88');
      print(response);
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        child: Container(
          color: Color.fromRGBO(40, 73, 100, 1),
          padding: EdgeInsets.all(10),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: AppColors.primaryText,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  controller: _nameController,
                ),
                TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Number of Team Members',
                    labelStyle: TextStyle(
                      color: AppColors.primaryText,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  controller: _numberOfTeamsController,
                ),
                TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Start Date',
                    labelStyle: TextStyle(
                      color: AppColors.primaryText,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  controller: _startDateController,
                ),
                TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'End Date',
                    labelStyle: TextStyle(
                      color: AppColors.primaryText,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  controller: _endDateController,
                ),
                TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Target Sales Goal',
                    labelStyle: TextStyle(
                      color: AppColors.primaryText,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  controller: _targetGoalController,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Money Raised',
                    labelStyle: TextStyle(
                      color: AppColors.primaryText,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  controller: _moneyRaisedController,
                ),
                TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Location',
                    labelStyle: TextStyle(
                      color: AppColors.primaryText,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  controller: _locationController,
                ),
                TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Time of Event',
                    labelStyle: TextStyle(
                      color: AppColors.primaryText,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  controller: _timeController,
                ),
                SizedBox(height: 80),
                ButtonTheme(
                  minWidth: 150.0,
                  height: 50.0,
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0),
                    ),
                    child: Text('Add Event'),
                    color: AppColors.secondaryElement,
                    textColor: Theme.of(context).textTheme.button.color,
                    onPressed: _submitData,
                  ),
                ),
                SizedBox(height: 90),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
