import 'package:flutter/material.dart';
import '../styles/style.dart';
import '../values/values.dart';
import '../widgets/main_drawer.dart';
import 'package:intl/intl.dart';
import 'package:scoutboard/widgets/globals.dart' as global;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:scoutboard/widgets/globals.dart' as global;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';


class Album{ // change this to parse what data you need

   String Name;
   String Stock;
   String Sold;
   String Category;
   String Price;
   String Measurement;
  Album({this.Name, this.Stock, this.Sold, this.Category, this.Price, this.Measurement});

  factory Album.fromJson(Map<String, dynamic> json){

    return Album(

      Name: json['Name'],
      Stock: json['Stock'],
      Sold: json['Sold'],
      Category: json['Category'],
      Price: json['Price'],
      Measurement: json['Measurement'],

    );

  }
}


class Album2{ // change this to parse what data you need

  String MoneyRaised;
  String Name;
  String NumberOfTeams;
  String StartDate;
  String EndDate;
  String TargetGoal;
  String Location;
  String Time;
  String ID;
  Album2({this.MoneyRaised, this.Name, this.NumberOfTeams, this.StartDate, this.EndDate, this.TargetGoal, this.Location, this.Time, this.ID});

  factory Album2.fromJson(Map<String, dynamic> json){

    return Album2(

        MoneyRaised: json['MoneyRaised'],
        Name: json['Name'],
        NumberOfTeams: json['NumberOfTeams'],
        StartDate: json['StartDate'],
        EndDate: json['EndDate'],
        TargetGoal: json['TargetGoal'],
        Location: json['Location'],
        Time: json['Time'],
        ID: json['ID'],

    );

  }
}

Future<Album2> createAlbum2(String ID) async {


  final http.Response response = await http.post(
      'https://scoutboard.appspot.com/getting_closestEvent',

      body:

      {
        'ScoutID': ID,
      }

  );
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

List<Album> parseAlbums(String responseBody){
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
}
Future<List<Album>> createAlbum(String ID) async {

  // trying to connect to database here
  final http.Response response = await http.post(
      'https://scoutboard.appspot.com/inventory', // change this to what page you are requesting data from

      body:
      {
        'ScoutID': ID,
      }

  );

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    try{
      return parseAlbums(response.body);
    }catch(err){
      print("Error in returning album");
      return null;
    }
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class StatefulWidgetReg extends StatefulWidget {
  static const routeName = '/dashboard-screen';

  StatefulWidgetReg({Key key}) : super(key: key);


  @override
  DashboardScreen createState(){

    return DashboardScreen();

  }
}


class DashboardScreen extends State<StatefulWidgetReg> {
  Future<List<Album>> futureAlbum;
  Future<List<Album>> futureAlbum2;
  String Name1 = "";
  String Name2 = "";
  String Name3 = "";
  String Measurement1 = "";
  String Measurement2 = "";
  String Measurement3 = "";
  String Stock1 = "";
  String Stock2 = "";
  String Stock3 = "";

  String MoneyRaised = "1";
  String Name = "";
  String StartDate = "";
  String EndDate = "";
  String TargetGoal = "1";
  String Location = "";
  String Time = "";


  Timer timer;
  DashboardScreen() {

     createAlbum2(global.userID).then((futureAlbum2) {

       if(futureAlbum != null) {
         MoneyRaised = futureAlbum2.MoneyRaised;
         Name = futureAlbum2.Name;
         StartDate = futureAlbum2.StartDate;
         EndDate = futureAlbum2.EndDate;
         TargetGoal = futureAlbum2.TargetGoal;
         Location = futureAlbum2.Location;
         Time = futureAlbum2.Time;
       }
    }
    ).catchError((e){
      print("Error in getting closest event");
    });

     createAlbum(global.userID).then((futureAlbum) => setState((){

       if(futureAlbum.isNotEmpty)
      futureAlbum.sort((a,b) => a.Stock.compareTo(b.Stock));

       Name1 = "";
       Name2 = "";
       Name3 = "";
       Measurement1 = "";
       Measurement2 = "";
       Measurement3 = "";
       Stock1 = "";
       Stock2 = "";
       Stock3 = "";

      if(futureAlbum.length >= 3) {
        for (int i = 0; i < 3; i++) {
          if(i == 0) {
            Name1 = futureAlbum[i].Name;
            Stock1 = futureAlbum[i].Stock;
            Measurement1 = futureAlbum[i].Measurement;
          }
          else if(i == 1){
            Name2 = futureAlbum[i].Name;
            Stock2 = futureAlbum[i].Stock;
            Measurement2 = futureAlbum[i].Measurement;
          }
          else if(i == 2){
            Name3 = futureAlbum[i].Name;
            Stock3 = futureAlbum[i].Stock;
            Measurement3 = futureAlbum[i].Measurement;
          }
          }
      }else{
        for (int i = 0; i < futureAlbum.length; i++) {
          if(i == 0){
            Name1 = futureAlbum[i].Name;
            Stock1 = futureAlbum[i].Stock;
            Measurement1 = futureAlbum[i].Measurement;
          }
          else if(i == 1){

            Name2 = futureAlbum[i].Name;
            Stock2 = futureAlbum[i].Stock;
            Measurement2 = futureAlbum[i].Measurement;
          }
        }
      }

    }));
  }




  @override
  Widget build(BuildContext context) {



    var now = new DateTime.now();
    var formatter = new DateFormat('MM/dd/yyyy');
    String formattedDate = formatter.format(now);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Dashboard'),
      ),
      drawer: MyDrawer(),
      body: Container(
        child: Style(
          decoration: StyleDecoration(
            color: Color.fromARGB(240, 90, 20, 0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 30,
                  height: 0,
                  margin: EdgeInsets.only(left: 15, top: 31),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,

                child: Container(
                  width: 160,
                  height: 17,
                  margin: EdgeInsets.only(left: 15, bottom: 15),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 3,
                        child: Text(
                          formattedDate,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "Source Sans Pro",
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 200,
                  margin: EdgeInsets.only(),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 16,
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(26, 0, 0, 0),
                                offset: Offset(5, 0),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            "assets/images/sidebarbg-2.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 314,
                              height: 181,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    right: 0,
                                    child: Image.asset(
                                      "assets/images/path-3157.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Positioned(
                                    left: 19,
                                    top: 13,
                                    right: 26,
                                    bottom: 1,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Goal",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.cyanAccent,
                                              fontFamily: "Source Sans Pro",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: new CircularPercentIndicator(
                                            radius: 100.0,
                                            lineWidth: 10.0,
                                            percent: (double.parse(MoneyRaised) / double.parse(TargetGoal)),
                                            center: new Text((

                                                ((double.parse(MoneyRaised) / double.parse(TargetGoal)) * 100.0).toString() + '%'),


                                              style: TextStyle(fontSize: 22),),
                                            backgroundColor: Colors.white,
                                            progressColor: AppColors.secondaryElement,
                                          ),
                                        ),
                                        Container(
                                          height: 35,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Container(
                                                  margin: EdgeInsets.only(bottom: 10),
                                                  child: Text(
                                                    '\$' + MoneyRaised,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 208, 219, 233),
                                                      fontFamily: "Source Sans Pro",
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 19,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              Align(
                                                alignment: Alignment.bottomRight,
                                                child: Container(
                                                  margin: EdgeInsets.only(bottom: 7),
                                                  child: Text(
                                                   '\$' + TargetGoal,
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 208, 219, 233),
                                                      fontFamily: "Source Sans Pro",
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 19,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Container(
                              width: 314,
                              height: 173,
                              decoration: BoxDecoration(
                                color: AppColors.primaryBackground,
                                borderRadius: BorderRadius.all(Radius.circular(40)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 19, top: 13),
                                    child: Text(
                                      "Upcoming Event",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.cyanAccent,
                                        fontFamily: "Source Sans Pro",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 250,
                                    height: 21,
                                    margin: EdgeInsets.only(left: 19, top: 12),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Name:",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontFamily: "Source Sans Pro",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 33),
                                            child: Text(
                                              Name,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontFamily: "Source Sans Pro",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    width: 180,
                                    height: 21,
                                    margin: EdgeInsets.only(left: 19),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Location:",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontFamily: "Source Sans Pro",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 14),
                                            child: Text(
                                              Location,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontFamily: "Source Sans Pro",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 215,
                                    height: 17,
                                    margin: EdgeInsets.only(left: 19),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "Start Date:",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontFamily: "Source Sans Pro",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 4),
                                            child: Text(
                                              StartDate,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontFamily: "Source Sans Pro",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 182,
                                    height: 21,
                                    margin: EdgeInsets.only(left: 19, bottom: 2),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "Time:",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontFamily: "Source Sans Pro",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 38),
                                            child: Text(
                                              Time,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontFamily: "Source Sans Pro",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 314,
                              height: 173,
                              decoration: BoxDecoration(
                                color: AppColors.primaryBackground,
                                borderRadius: BorderRadius.all(Radius.circular(40)),
                              ),
                              margin: EdgeInsets.only(top: 8),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 19, top: 13, bottom: 14),
                                    child: Text(
                                      "Lowest Inventory",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.cyanAccent,
                                        fontFamily: "Source Sans Pro",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: 250,
                                    height: 17,
                                    margin: EdgeInsets.only(left: 18),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                             Name1 + ':',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontFamily: "Source Sans Pro",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 7),
                                            child: Text(
                                              Stock1 + "  " + Measurement1,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontFamily: "Source Sans Pro",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 250,
                                    height: 21,
                                    margin: EdgeInsets.only(left: 18,),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            Name2 + ':',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontFamily: "Source Sans Pro",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 7),
                                            child: Text(
                                              Stock2 + "  " + Measurement2,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontFamily: "Source Sans Pro",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 240,
                                    height: 21,
                                    margin: EdgeInsets.only(left: 18, bottom: 55),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            Name3 + ':',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontFamily: "Source Sans Pro",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 7),
                                            child: Text(
                                              Stock3 + "  " + Measurement3,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontFamily: "Source Sans Pro",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
