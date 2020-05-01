import 'package:flutter/foundation.dart';
import '../color/colors.dart';
import '../screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoutboard/screens/groups_detail_screen.dart';
import 'package:scoutboard/widgets/globals.dart' as global;
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'groups_detail_screen.dart';

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
/*
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
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(StatefulWidgetReg.routeName);
            }),
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

*/



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

List<Album> parseAlbums(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
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


class GroupsScreen extends StatefulWidget {
  static const routeName = '/groups-screen';
  GroupsScreen({Key key}) : super(key: key);

  @override
  GroupsScreenState createState() => GroupsScreenState();
}

class GroupsScreenState extends State<GroupsScreen> {
  void _startAddNewMember(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Color.fromRGBO(255, 0, 0, 0.0),
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewScout(),
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
          'Members',
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add), 
            onPressed: () {
            setState(() {
              _startAddNewMember(context);
              
              
            });
            
            })
        ],
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
                          ScoutsList(
                            futureAlbum: snapshot.data,
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(child: CircularProgressIndicator());
          }),
        
    );
  }
}

class ScoutsList extends StatefulWidget {
  static const routeName = '/groups-screen';
  final List<Album> futureAlbum;
  

  ScoutsList({Key key, this.futureAlbum}) : super(key: key);

  @override
  _ScoutsListState createState() => _ScoutsListState();
}

class _ScoutsListState extends State<ScoutsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: widget.futureAlbum.isEmpty
          ? Container(
              alignment: Alignment(0.0, -0.3),
              child: Text(
                'No Scouts added yet!',
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
                  //child: ListView(
                    //actionPane: SlidableDrawerActionPane(),
                   // actionExtentRatio: 0.25,
                     child:ListTile(
                  
                      title: Text(widget.futureAlbum[index].firstName,
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.primaryText,
                          )),
                    
                      subtitle: Text(widget.futureAlbum[index].lastName,
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.primaryText,
                          )),
                          onTap: (){
                            var route = new MaterialPageRoute(
                              builder: (BuildContext context) =>
                              new GroupdetailWidget(value: widget.futureAlbum[index].firstName, last: widget.futureAlbum[index].lastName)
                              );
                              Navigator.of(context).push(route);
                          },
                     ),

                );
              },
              itemCount: widget.futureAlbum.length,
            ),
    );
  }
}

class NewScout extends StatefulWidget {
  @override
  _NewScoutState createState() => _NewScoutState();
}

class _NewScoutState extends State<NewScout> {
  List<String> names = [];
  String enteredfirstName;
  String enteredlastName;
  String enteredsold;
  String enteredstock;
  String enteredrank;
  String temp;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _soldController = TextEditingController();
  final _stockController = TextEditingController();
  final _rankController = TextEditingController();

  void _submitData() {
    if (_firstNameController.text.isEmpty) {
      return;
    }
    final enteredfirstName = _firstNameController.text;
    final enteredlastName = _lastNameController.text;
    final enteredsold = _soldController.text;
    final enteredstock = _stockController.text;
    final enteredrank = _rankController.text;

    if (enteredfirstName.isEmpty ||
        enteredlastName.isEmpty
      ) {
      return;
    }

    print(enteredfirstName);
    print(enteredlastName);
    String response;
    addAlbum(enteredfirstName, enteredlastName, enteredsold, enteredstock,enteredrank, global.userID)
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
                    labelText: 'First Name',
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
                  controller: _firstNameController,
                  onChanged: (text){
                    temp = text;
                  },
                ),
                TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Last Name',
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
                  controller: _lastNameController,
                 
                ),
                
                SizedBox(height: 80),
                ButtonTheme(
                  minWidth: 150.0,
                  height: 50.0,
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0),
                    ),
                    child: Text('Add Scouts'),
                    color: AppColors.secondaryElement,
                    textColor: Theme.of(context).textTheme.button.color,
                    onPressed: () {
                      enteredfirstName = _firstNameController.text;
                      enteredlastName = _lastNameController.text;
                      _soldController.text = "1";
                      _stockController.text = "empty";
                      _rankController.text = "empty";
                      setState(() {
                        names.add(temp);
                       _submitData();
                        //
                      });
                    
                    }),
                ),
                SizedBox(height: 140),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

