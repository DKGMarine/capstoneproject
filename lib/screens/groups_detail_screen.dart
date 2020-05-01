import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scoutboard/screens/events_screen.dart';
import 'package:scoutboard/screens/groups_screen.dart';
import 'package:scoutboard/widgets/globals.dart' as global;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';


/*class Album{ // change this to parse what data you need

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
*//*
class Info {
  int sales;
  String event;
 
  Info(this. sales, this.event);
 
  static List<Info> getInfo() {
    return <Info>[
      Info(1, 'Cookie Stand'),
      Info(2, 'Lemonade Stand'),
      Info(3, 'Carnival'),
    ];
  }
}

class GroupdetailWidget extends StatefulWidget {
  //final Album value;

 // GroupdetailWidget({Key key, this.value}) : super(key: key);
  @override
  _GroupState createState() => new _GroupState();
}

class _GroupState extends State<GroupdetailWidget> {
  List<Info> _info = Info.getInfo();
  List<DropdownMenuItem<Info>> _dropdownMenuItems;
  Info _selectedInfo;
  void initState() {
  _dropdownMenuItems = buildDropdownMenuItems(_info);
  _selectedInfo = _dropdownMenuItems[0].value;
  super.initState();
}
 List<DropdownMenuItem<Info>> buildDropdownMenuItems(List info) {
    List<DropdownMenuItem<Info>> items = List();
    for (Info events in info) {
      items.add(
        DropdownMenuItem(
          value: events,
          child: Text(events.event, style: TextStyle(color: Colors.white60) ),
        ),
      );
    }
    return items;
  }
  onChangeDropdownItem(selectedInfo) {
    setState(() {
      _selectedInfo = selectedInfo;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Member Detail'
       // title: Text('${widget.value.name}'
        ),
      ),
        
      body: new Column(
        children:<Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text('Member:', style: TextStyle(fontSize: 20)),
            //child: Text('Member: ${widget.value.name}', style: TextStyle(fontSize: 20)),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 50),
            alignment: Alignment.topLeft,
           // child: Text('Age: ${widget.value.age}', style: TextStyle(fontSize: 20)),
          ),
            
            Container(
              padding: EdgeInsets.only(bottom: 0),
              alignment: Alignment.topCenter,
              child: Text('Events',style: TextStyle(fontSize: 25)),
                  
            ),
            Container(
              padding: EdgeInsets.only(bottom: 30),
              alignment: Alignment.bottomLeft,
              child:DropdownButton(
                  
                  value: _selectedInfo,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),

            ),
            Container(
              padding: EdgeInsets.only(bottom: 0),
              alignment: Alignment.topCenter,
              child: Text('Members Raiting',style: TextStyle(fontSize: 25)),
                  
            ),
            Container(
              padding: EdgeInsets.only(bottom: 40),
              alignment: Alignment.topCenter,
              child: 
              RatingBar(
              initialRating: 0,
              minRating: 0.5,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal:  .5),
              itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.blue[200],
            ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            ),
              
              
           // ),
            Container(
              padding: EdgeInsets.only(bottom: 0),
              alignment: Alignment.topCenter,
              child: Text('Sales',style: TextStyle(fontSize: 30)),
            ),
          Padding(
                padding: EdgeInsets.all(15.0),
                child: new CircularPercentIndicator(
                  radius: 180.0,
                  lineWidth: 10.0,
                  percent: .30,
                  center: new Text("30% of Sales made"),
                  backgroundColor: Colors.blueGrey,
                  progressColor: Colors.blue[300],
                ),
              ),

          
       ]
        
        
        
      )
    );
    
  }
}
*/
/* ___________________- */

class Album {
  // change this to parse what data you need

  final String firstName;
  final String lastName;
  final String sold;
  final String stock;
  final String rank;
  final String scoutID;
  Album(
      {this.firstName,
      this.lastName,
      this.sold,
      this.stock,
      this.rank,
      this.scoutID});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      firstName: json['FirstName'],
      lastName: json['LastName'],
      sold: json['Sold'],
      stock: json['Stock'],
      rank: json['Rank'],
      scoutID: json['ScoutID'],
    );
  }
}

Future<List<Album>> createAlbum(String id) async {
  final http.Response response = await http.post(
      'http://scoutboard.appspot.com/members', // change this to what page you are requesting data from

      body: {
        'ScoutID': id,
      });

 if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.

    print('1');
    print(response.body);
    //print(json.decode(response.body));
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

List<Album> parseAlbums(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
}

Future addAlbum(String firstName, String lastName, String sold, String stock,
    String rank, String id) async {
  //ID = '25275';
  final http.Response response = await http.post(
      'http://scoutboard.appspot.com/addScoutMembers', // change this to what page you are requesting data from

      body: {
        'FirstName': firstName,
        'LastName': lastName,
        'Sold': sold,
        'Stock': stock,
        'Rank': rank,
        'ScoutID': id,
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.

    print('1');
    print(response.body);
   // print(json.decode(response.body));
    return response.body;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class GroupdetailWidget  extends StatefulWidget {
  //static const routeName = '/dashboard-screen';
  final String value;
  final String last;
  GroupdetailWidget ({Key key, this.value, this.last}) : super(key: key);

  @override
  _GroupState createState() {
    return _GroupState();
  }
}

class _GroupState extends State<GroupdetailWidget > {
  Future<List<Album>> futureAlbum;
  String firstName;
  String lastName;
  String sold;
  String stock;
  String rank;
  String scoutID;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        title: new Text("${widget.value}"),
      ),
      body: new Column(
        children:<Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text('Member: ${widget.value} ${widget.last}', style: TextStyle(fontSize: 20)),
            //child: Text('Member: ${widget.value.name}', style: TextStyle(fontSize: 20)),
          ),
        ]
      )
    );
  }
}
