import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scoutboard/screens/events_screen.dart';
import 'package:scoutboard/screens/groups_screen.dart';
import 'package:scoutboard/widgets/globals.dart' as global;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../color/colors.dart';
import '../color/colors.dart';
import 'dashboard_screen.dart';
import 'sales_screen.dart';


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


/*
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
Future addAlbum(String name, String price, String stock, String sold,
    String category, String typeOfM, String id) async {
  //ID = '25275';
  final http.Response response = await http.post(
      'https://scoutboard.appspot.com//modify_member', // change this to what page you are requesting data from

      body: {
        'Name': name,
        'Price': price,
        'Stock': stock,
        'Sold': sold,
        'Category': category,
        'Type_of_M': typeOfM,
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

List<Album> parseAlbums(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
}

Future addAlbumEvent(String name, String price, String stock, String sold,
    String category, String typeOfM, String id) async {
  //ID = '25275';
  final http.Response response = await http.post(
      'http://scoutboard.appspot.com//addinventory', // change this to what page you are requesting data from

      body: {
        'Name': name,
        'Price': price,
        'Stock': stock,
        'Sold': sold,
        'Category': category,
        'Type_of_M': typeOfM,
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
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        title: new Text("${widget.value}"),
      ),
      body: 
        new Column(
        children:<Widget>[
          Container(
            
            decoration: BoxDecoration(
              color: AppColors.accentText,
             border: Border.all(
              color: AppColors.accentText,
                width: 8,
            ),
            ),
            alignment: Alignment.topLeft,
            child: Text('Member: ${widget.value} ${widget.last}', style: TextStyle(fontSize: 20)),
            
            
          ),
           
        ]
      )
      
    );
  }
}


class NewSale extends StatefulWidget {
  @override
  _NewSalesState createState() => _NewSalesState();
}

class _NewSalesState extends State<NewSale> {
  final _totalSoldController = TextEditingController();


  void _submitData() {
    final enteredTotalSold = _totalSoldController.text;

    // need to convert to ints to compare
    var oldAmnt = int.parse(stock);
    var amntSold = int.parse(enteredTotalSold);
    var total = int.parse(sold);
    var diff = oldAmnt - amntSold;  // used to test if there is enough stock
    total = total + amntSold; // add on new amount sold to previous amount sold

    // convert back to string to output
    final String difference = diff.toString();
    final String totalSold = total.toString();

    // check if enough in stock, and that amount sold isn't negative
    if(diff >= 0 && total >= 0) {
      addAlbum(
          name,
          price,
          difference,
          totalSold,
          category,
          typeOfM, /*global.userID*/
          id)
          .then((response) {
        print('88');
        print(response);
      });
      Navigator.of(context).pop();
    }
    else { // if not enough stock, restore previous information
      addAlbum(
          name,
          price,
          stock,
          sold,
          category,
          typeOfM, /*global.userID*/
          id)
          .then((response) {
        print('88');
        print(response);
      });
      Navigator.of(context).pop();
    }
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
                    labelText: 'Total Sold',
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
                  controller: _totalSoldController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 80),
                ButtonTheme(
                  minWidth: 150.0,
                  height: 50.0,
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0),
                    ),
                    child: Text('Add Sale'),
                    color: AppColors.secondaryElement,
                    textColor: Theme.of(context).textTheme.button.color,
                    onPressed: _submitData,
                  ),
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
*/



class Album {
  // change this to parse what data you need

  String name;
  String stock;
  String sold;
  String category;
  String price;
  String measurement;
  Album(
      {this.name,
      this.stock,
      this.sold,
      this.category,
      this.price,
      this.measurement});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['Name'],
      stock: json['Stock'],
      sold: json['Sold'],
      category: json['Category'],
      price: json['Price'],
      measurement: json['Measurement'],
    );
  }
}

class Album2 {
  // change this to parse what data you need

  String moneyRaised;
  String name;
  String numberOfTeams;
  String startDate;
  String endDate;
  String targetGoal;
  String location;
  String time;
  String id;
  Album2(
      {this.moneyRaised,
      this.name,
      this.numberOfTeams,
      this.startDate,
      this.endDate,
      this.targetGoal,
      this.location,
      this.time,
      this.id});

  factory Album2.fromJson(Map<String, dynamic> json) {
    return Album2(
      moneyRaised: json['MoneyRaised'],
      name: json['Name'],
      numberOfTeams: json['NumberOfTeams'],
      startDate: json['StartDate'],
      endDate: json['EndDate'],
      targetGoal: json['TargetGoal'],
      location: json['Location'],
      time: json['Time'],
      id: json['ID'],
    );
  }
}

Future<Album2> createAlbum2(String ID) async {

  ID = '25275';
  final http.Response response = await http
      .post('https://scoutboard.appspot.com/getting_closestEvent', body: {
    'ScoutID': ID,
  });
  print('1');
  print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    return Album2.fromJson(json.decode(response.body));
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

Future<List<Album>> createAlbum(String ID) async {
  // trying to connect to database here
  final http.Response response = await http.post(
      'https://scoutboard.appspot.com/inventory', // change this to what page you are requesting data from

      body: {
        'ScoutID': ID,
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    try {
      return parseAlbums(response.body);
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

class GroupdetailWidget extends StatefulWidget {
  final String value;
  final String last;
  //static const routeName = '/groups-screen';
  GroupdetailWidget({Key key, this.value, this.last}) : super(key: key);



  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<GroupdetailWidget > {
  Future<List<Album>> futureAlbum;
  Future<List<Album>> futureAlbum2;

  String name1 = "";
  String measurement1 = "";
  String stock1 = "";

  String moneyRaised = "1";
  String name = "";
  String startDate = "";
  String endDate = "";
  String targetGoal = "1";
  String location = "";
  String time = "";

  Timer timer;
 _GroupState(){
   createAlbum2(global.userID).then((futureAlbum2){
     if(futureAlbum2.moneyRaised != null){
        moneyRaised = futureAlbum2.moneyRaised;
        name = futureAlbum2.name;
        startDate = futureAlbum2.startDate;
        endDate = futureAlbum2.endDate;
        targetGoal = futureAlbum2.targetGoal;
        location = futureAlbum2.location;
        time = futureAlbum2.time;
     }
   }).catchError((e){
      print("Error in getting closest event");
    });
createAlbum(global.userID).then((futureAlbum) => setState(() {
      if (futureAlbum.isNotEmpty)
        futureAlbum.sort((a, b) => a.stock.compareTo(b.stock));

      name1 = "";
      measurement1 = "";
      stock1 = "";


      if (futureAlbum.length >= 3) {
        for (int i = 0; i < 3; i++) {
            name1 = futureAlbum[i].name;
            stock1 = futureAlbum[i].stock;
            measurement1 = futureAlbum[i].measurement;
          
        }
      } else {
        for (int i = 0; i < futureAlbum.length; i++) {
          if (i == 0) {
            name1 = futureAlbum[i].name;
            stock1 = futureAlbum[i].stock;
            measurement1 = futureAlbum[i].measurement;
        }
      }
    }
}
));

 }
  @override
 
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        title: new Text('Member: ${widget.value} ${widget.last}', style: TextStyle(fontSize: 22)),
      ),
      body: 
        new Column(
        children:<Widget>[
          /*Container(
            
            
            alignment: Alignment.topLeft,
            child: Text('Member: ${widget.value} ${widget.last}', style: TextStyle(fontSize: 22)),
    
            
          ),*/
          Container(
            
            decoration: BoxDecoration(
              color: AppColors.accentText,
             
            ),
            alignment: Alignment.center,
            child: Text('Events' ,style: TextStyle(fontSize: 24) ),
    
            
          ),
          Container(
            padding: EdgeInsets.only(bottom: 100),
            
            alignment: Alignment.topLeft,
            child: Text('Event: ' + name + '      ' 'Location: ' +location+ ' ',style: TextStyle(fontSize: 18) ),
    
            
          ),
          
          Container(
            
            decoration: BoxDecoration(
              color: AppColors.accentText,
             border: Border.all(
              color: AppColors.accentText,
                width: 0,
            ),
            ),
            alignment: Alignment.center,
            child: Text('Sales' ,style: TextStyle(fontSize: 24) ),
    
            
          ),
          Padding(
                padding: EdgeInsets.all(15.0),
                child: new CircularPercentIndicator(
                  radius: 180.0,
                  lineWidth: 10.0,
                  percent: (double.parse(moneyRaised) /
                                                      double.parse(targetGoal)),
                  center: new Text((((double.parse(moneyRaised) /double.parse(targetGoal)) * 100.0).toString() +'%'),
                                                style: TextStyle(fontSize: 22),
                                              ),
                  backgroundColor: Colors.blueGrey,
                  progressColor: AppColors.secondaryElement,
                ),
              ),

           
        ]
      )
      
    );
  }
}
