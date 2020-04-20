import 'package:flutter/material.dart';
import '../styles/style.dart';
import '../values/values.dart';
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

class EventsScreen extends StatelessWidget {
  Future<Album> futureAlbum;


  static const routeName = '/events-screen';
  @override
  Widget build(BuildContext context) {

    createAlbum(global.userID.toString()).then((futureAlbum) {

      print('1');

    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Events'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Style(
          decoration: StyleDecoration(
            color: Color.fromARGB(255, 40, 73, 100),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 17,
                height: 17,
                margin: EdgeInsets.only(left: 14, top: 10),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, top: 13),
                child: Text(
                  "Events",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Source Sans Pro",
                    fontWeight: FontWeight.w400,
                    fontSize: 31,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 373,
                  margin: EdgeInsets.only(left: 2, top: 1),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 29,
                        top: 23,
                        bottom: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 314,
                                height: 46,
                               /*  child: FlatButton(
                                  onPressed: () => this.onDropboxPressed(context),
                                  color: AppColors.primaryElement,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: Radii.k23pxRadius,
                                  ),
                                  textColor: Color.fromARGB(255, 255, 255, 255),
                                  padding: EdgeInsets.all(0),
                                  child: Text(
                                    "+",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontFamily: "Ubuntu",
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                    ),
                                  ),
                                ), */
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 314,
                                height: 191,
                                margin: EdgeInsets.only(top: 36),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBackground,
                                  borderRadius: BorderRadius.all(Radius.circular(40)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 19, top: 14),
                                      child: Text(
                                        "April 1st 2020",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.secondaryText,
                                          fontFamily: "Source Sans Pro",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      height: 21,
                                      margin: EdgeInsets.only(left: 19, top: 18),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                              margin: EdgeInsets.only(left: 27),
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
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                                "Weston, Josh, Karla",
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
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    Spacer(),
                                    Container(
                                      width: 182,
                                      height: 23,
                                      margin: EdgeInsets.only(left: 19, bottom: 31),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                              margin: EdgeInsets.only(left: 32, bottom: 2),
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
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 314,
                                height: 191,
                                margin: EdgeInsets.only(top: 15),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBackground,
                                  borderRadius: BorderRadius.all(Radius.circular(40)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 19, top: 14),
                                      child: Text(
                                        "April 1st 2020",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.secondaryText,
                                          fontFamily: "Source Sans Pro",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      height: 21,
                                      margin: EdgeInsets.only(left: 19, top: 18),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                              margin: EdgeInsets.only(left: 27),
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
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                                "Weston, Josh, Karla",
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
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    Spacer(),
                                    Container(
                                      width: 182,
                                      height: 23,
                                      margin: EdgeInsets.only(left: 19, bottom: 31),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                              margin: EdgeInsets.only(left: 32, bottom: 2),
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
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 314,
                                height: 191,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBackground,
                                  borderRadius: BorderRadius.all(Radius.circular(40)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 19, top: 14),
                                      child: Text(
                                        "April 1st 2020",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.secondaryText,
                                          fontFamily: "Source Sans Pro",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      height: 21,
                                      margin: EdgeInsets.only(left: 19, top: 18),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                              margin: EdgeInsets.only(left: 27),
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
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                                "Weston, Josh, Karla",
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
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    Spacer(),
                                    Container(
                                      width: 182,
                                      height: 23,
                                      margin: EdgeInsets.only(left: 19, bottom: 31),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                              margin: EdgeInsets.only(left: 32, bottom: 2),
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
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(),
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