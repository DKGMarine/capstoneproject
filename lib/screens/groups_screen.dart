import 'package:flutter/material.dart';
import 'package:scoutboard/screens/groups_detail_screen.dart';
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


  ID = '25275';
  final http.Response response = await http.post(
      'https://capstoneproject-271322.appspot.com/teams', // change this to what page you are requesting data from

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
class Member {
  final String name, age;
  const Member(
    {
    this.name,
    this.age,
    }
    
  );
}

class GroupsScreen extends StatefulWidget{
  static const routeName = '/groups-screen';
  @override

  GroupsScreenState createState() => new GroupsScreenState();

}

class GroupsScreenState extends State<GroupsScreen>{
  var _nameController = new TextEditingController();
  var _ageController1 = new TextEditingController();
  Future<Album> futureAlbum;
  List<String> item = [];
  String temp;
  final TextEditingController eCtrl = new TextEditingController();


 
  @override
  Widget build(BuildContext context){
    createAlbum(global.userID).then((futureAlbum) {

      print('1');

    });
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
            child: Text('Age',style: TextStyle(fontSize: 20)),
          ),
         TextField(
              decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
              hintText: 'Enter Members Age',
              filled:true,

            ),
            controller: _ageController1,
         ),
          
         new RaisedButton(
           child: Text('Add Member'),
           onPressed: (){
             
             setState(() {
              item.add(temp);
               //_nameController.clear();
             });

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
        title: Text('Members'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add), 
            onPressed: () => _modalPress(),
            
          )
        ],
      ),
      body: new Column(
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
                            value: Member(
                              name: _nameController.text,
                              age: _ageController1.text,
                            )
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