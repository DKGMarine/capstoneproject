import 'package:flutter/material.dart';
import '../styles/style.dart';
import '../values/values.dart';
import '../widgets/main_drawer.dart';
import 'package:intl/intl.dart';
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

  // trying to connect to database here
  ID = '25275';
  final http.Response response = await http.post(
      'https://capstoneproject-271322.appspot.com/overview', // change this to what page you are requesting data from

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



class DashboardScreen extends StatelessWidget {
  Future<Album> futureAlbum;
  static const routeName = '/dashboard-screen';

  @override
  Widget build(BuildContext context) {

    var now = new DateTime.now();
    var formatter = new DateFormat('MM/dd/yyyy');
    String formattedDate = formatter.format(now);

    createAlbum(global.userID.toString()).then((futureAlbum) {

    print('1');

    });
    return Scaffold(

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
                              height: 180,
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
                                            "Net Gain",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.accentText,
                                              fontFamily: "Source Sans Pro",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            width: 47,
                                            height: 47,
                                            margin: EdgeInsets.only(left: 104, top: 17),
                                            child: Image.asset(
                                              "assets/images/backward-arrow-2.png",
                                              fit: BoxFit.none,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            width: 267,
                                            height: 9,
                                            margin: EdgeInsets.only(left: 2),
                                            child: Image.asset(
                                              "assets/images/path-3149.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 28,
                                          margin: EdgeInsets.only(left: 7, right: 3),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Container(
                                                  margin: EdgeInsets.only(bottom: 7),
                                                  child: Text(
                                                    "\$3671",
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
                                                    "Goal",
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
                                  Positioned(
                                    left: 21,
                                    bottom: 29,
                                    child: Image.asset(
                                      "assets/images/path-3150.png",
                                      fit: BoxFit.none,
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
                                        color: AppColors.accentText,
                                        fontFamily: "Source Sans Pro",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    height: 21,
                                    margin: EdgeInsets.only(left: 19, top: 12),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Name",
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
                                            margin: EdgeInsets.only(left: 20),
                                            child: Text(
                                              "Cookie table",
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
                                    width: 74,
                                    height: 21,
                                    margin: EdgeInsets.only(left: 19),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Group",
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
                                            margin: EdgeInsets.only(left: 24),
                                            child: Text(
                                              "1",
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
                                    width: 198,
                                    height: 21,
                                    margin: EdgeInsets.only(left: 19),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Members",
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
                                            margin: EdgeInsets.only(left: 4),
                                            child: Text(
                                              "Weston",
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
                                    width: 124,
                                    height: 21,
                                    margin: EdgeInsets.only(left: 19),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Location",
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
                                            margin: EdgeInsets.only(left: 8),
                                            child: Text(
                                              "Walmart",
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
                                    height: 23,
                                    margin: EdgeInsets.only(left: 19, bottom: 20),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "Time",
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
                                            margin: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "3:30 PM - 5:00 PM",
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
                                    margin: EdgeInsets.only(left: 19, top: 13),
                                    child: Text(
                                      "Low Inventory",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: AppColors.accentText,
                                        fontFamily: "Source Sans Pro",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 200,
                                    height: 21,
                                    margin: EdgeInsets.only(left: 18),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "Item 1:",
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
                                              "Number of items",
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
                                    width: 200,
                                    height: 21,
                                    margin: EdgeInsets.only(left: 18,),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "Item 2:",
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
                                              "Number of items",
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
                                            "Item 3:",
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
                                              "Number of low items",
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
