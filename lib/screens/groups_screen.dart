import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scoutboard/screens/groups_detail_screen.dart';
import 'package:scoutboard/widgets/globals.dart' as global;
import 'package:http/http.dart' as http;
import 'dart:convert';

/*
RETRIEVING MEMBERS:

Page: '/members'

'ScoutID':
*/

/*
ADDING SCOUT MEMBER:

Page: '/addScoutMembers'

'FirstName':
'LastName':
'NumberOfSales':
'Rank':
'ScoutID':

*/

/*class Album {
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

List<Album> parseAlbums(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
}

Future<List<Album>> createAlbum(String id) async {
 //ID = '25275';
  final http.Response response = await http.post(
      'http://scoutboard.appspot.com/members', // change this to what page you are requesting data from

      body: {
        'ScoutID': id,
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.

    print('1');
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

Future addAlbum(String firstName, String lastName, String sold,
    String stock, String rank, String id) async {
  //ID = '25275';
  final http.Response response = await http.post(
      'http://scoutboard.appspot.com/addScoutMembers', // change this to what page you are requesting data from

      body: {
        'FirstName': firstName,
        'LastName': lastName,
        'Stock': stock,
        'Sold': sold,
        'Stock': stock,
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
*/

/*
-------------------

*/


/*class Member {
  final String name, age;
  const Member(
    {
    this.name,
    this.age,
    }
    
  );
}*/
Future createAlbum(String firstName, String lastName, String sold,
    String stock, String rank, String scoutID) async {

  final http.Response response = await http.post(
      'http://scoutboard.appspot.com/addScoutMembers',
      body:

      {
        'FirstName': firstName,
        'LastName': lastName,
        'Stock': stock,
        'Sold': sold,
        'Rank': rank,
        'ScoutID': scoutID,
      }

  );

  print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    return response.body;

  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}



class GroupsScreen extends StatefulWidget{
  static const routeName = '/groups-screen';
  
  @override

  GroupsScreenState createState() => new GroupsScreenState();

}

class GroupsScreenState extends State<GroupsScreen>{
  String firstName;
  String lastName;
  String sold;
  String stock;
  String rank;
  String scoutID;
  final _nameController = new TextEditingController();
  final _lastNameController = new TextEditingController();
  final _stockController = new TextEditingController();

  var _ageController1 = new TextEditingController();
  List<String> item = [];
  String temp;
  final TextEditingController eCtrl = new TextEditingController();


 
  @override
  Widget build(BuildContext context){
    //createAlbum(global.userID).then((futureAlbum) {

     // print('1');

   // });
  void _modalPress(){
    showModalBottomSheet(context: context, 
    builder: (context){
      return Column(
        children:  <Widget>[
          
          Align(
            alignment: Alignment.topLeft,
            child: Text('Name', style: TextStyle(fontSize: 20)),
          ),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
              hintText: 'Enter Members Name',
              filled:true,

            ),
            controller: _nameController,
            onChanged: (text){
              temp = text;
            },
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text('Last Name',style: TextStyle(fontSize: 20)),
          ),
         TextField(
              decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
              hintText: 'Enter Members Last Name',
              filled:true,

            ),
            controller: _lastNameController,
         ),
          
         new RaisedButton(
           child: Text('Add Member'),
           onPressed: (){
             firstName = _nameController.text;
             lastName = _lastNameController.text;
             sold = '1';
             stock = 'empty';
             rank = 'empty';
             scoutID = '25275';
             setState(() {
              item.add(temp);
               //_nameController.clear();
             });
              createAlbum(firstName, lastName, sold, stock, rank, scoutID);
             Navigator.pop(context);
           },
         )
        ],

      );
      
    });
  } 
    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Scouts'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add), 
            onPressed: () => _modalPress(),
            
          )
        ],
      ),
      body:
       new Column(
        children: <Widget>[
          
          new Expanded(
            child: new ListView.builder(
              itemCount: item.length,
              itemBuilder: (BuildContext ctxt, int index){
                return new Card(
                  color: Colors.blue[100],
                  child: ListTile(
                    title: Text(item[index]),
                    onTap: (){
                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                          new GroupdetailWidget(
                            /*value: Album(
                              firstName: _nameController.text,
                              age: _ageController1.text,
                            )*/
                          )
                        );
                        Navigator.of(context).push(route);
                    },
                  ),
                  
                ); 
              }
              )
            )
        ],
      )
    );

  }


}