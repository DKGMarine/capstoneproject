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


class GroupsScreen extends StatefulWidget{
  static const routeName = '/groups-screen';
  @override
  State<StatefulWidget> createState() {
    return GroupsScreenState();
  }

}

class GroupsScreenState extends State<GroupsScreen>{
  Future<Album> futureAlbum;
  List<String> item = [];
  final TextEditingController eCtrl = new TextEditingController();
  @override
  Widget build(BuildContext context){
    createAlbum(global.userID.toString()).then((futureAlbum) {

      print('1');

    });
    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Groups'),
      ),
      body: new Column(
        children: <Widget>[
          new TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
              prefixIcon: Icon(Icons.add),
              hintText: 'Enter Group Name',
              filled:true,

            ),
            controller: eCtrl,
            onSubmitted: (text){
              item.add(text);
              eCtrl.clear();
              setState(() {});
            },
          ),
          new Expanded(
            child: new ListView.builder(
              itemCount: item.length,
              itemBuilder: (BuildContext ctxt, int index){
                return new Card(
                  child: ListTile(
                    title: Text(item[index]),
                    onTap: (){
                      Navigator.push(
                        ctxt,
                        MaterialPageRoute(builder: (ctxt) => GroupdetailWidget(index))
                      );
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