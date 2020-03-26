/*
*  add_event_weston_widget.dart
*  ScoutBoard
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:capstoneproject/events_weston_widget/events_weston_widget.dart';
import 'package:capstoneproject/side_bar_weston3_widget/side_bar_weston3_widget.dart';
import 'package:capstoneproject/styles/style.dart';
import 'package:capstoneproject/values/values.dart';


class AddEventWestonWidget extends StatelessWidget {
  
  void onBackwardArrowPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => SideBarWeston3Widget()));
  
  void onDropboxPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => EventsWestonWidget()));
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Style(
          decoration: StyleDecoration(
            color: Color.fromARGB(255, 40, 73, 100),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 17,
                  height: 17,
                  margin: EdgeInsets.only(left: 14, top: 18),
                  child: FlatButton(
                    onPressed: () => this.onBackwardArrowPressed(context),
                    color: Color.fromARGB(0, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    textColor: Color.fromARGB(255, 0, 0, 0),
                    padding: EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/backward-arrow.png",),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 15, top: 13),
                  child: Text(
                    "Add Event",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "Source Sans Pro",
                      fontWeight: FontWeight.w400,
                      fontSize: 31,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 314,
                  height: 46,
                  margin: EdgeInsets.only(left: 31, top: 20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 0,
                        child: Container(
                          width: 314,
                          height: 46,
                          decoration: BoxDecoration(
                            color: AppColors.primaryElement,
                            borderRadius: Radii.k23pxRadius,
                          ),
                          child: Container(),
                        ),
                      ),
                      Positioned(
                        left: 23,
                        top: 9,
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
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 78,
                                height: 22,
                                margin: EdgeInsets.only(left: 47, top: 2),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter name",
                                    contentPadding: EdgeInsets.all(0),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Source Sans Pro",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                  maxLines: 1,
                                  autocorrect: false,
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
              Container(
                width: 314,
                height: 46,
                margin: EdgeInsets.only(top: 22),
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: Radii.k23pxRadius,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 21),
                      child: Text(
                        "Date",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Source Sans Pro",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 95,
                      height: 25,
                      margin: EdgeInsets.only(right: 104),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "DD/MM/YYYY",
                          contentPadding: EdgeInsets.all(0),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Source Sans Pro",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        autocorrect: false,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 314,
                  margin: EdgeInsets.only(top: 16, bottom: 7),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        right: 0,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              right: 0,
                              child: Container(
                                height: 46,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryElement,
                                  borderRadius: Radii.k23pxRadius,
                                ),
                                child: Container(),
                              ),
                            ),
                            Positioned(
                              left: 21,
                              top: 10,
                              right: 118,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Time\n",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: AppColors.primaryText,
                                        fontFamily: "Source Sans Pro",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 16,
                                      height: 25,
                                      margin: EdgeInsets.only(left: 56),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "  : ",
                                          contentPadding: EdgeInsets.all(0),
                                          border: InputBorder.none,
                                        ),
                                        style: TextStyle(
                                          color: AppColors.primaryText,
                                          fontFamily: "Source Sans Pro",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                        maxLines: 1,
                                        autocorrect: false,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 16,
                                      height: 25,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "  : ",
                                          contentPadding: EdgeInsets.all(0),
                                          border: InputBorder.none,
                                        ),
                                        style: TextStyle(
                                          color: AppColors.primaryText,
                                          fontFamily: "Source Sans Pro",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                        maxLines: 1,
                                        autocorrect: false,
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
                        top: 11,
                        child: Text(
                          "  to ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "Source Sans Pro",
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 314,
                height: 46,
                margin: EdgeInsets.only(top: 7),
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: Radii.k23pxRadius,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 21),
                      child: Text(
                        "Group",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Source Sans Pro",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 26,
                          margin: EdgeInsets.only(left: 47, top: 12, right: 69),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color.fromARGB(255, 40, 73, 100),
                            ),
                          ),
                          child: ListView.builder(
                            // ignore: missing_return
                            itemCount: 15, itemBuilder: (BuildContext context, int index) {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 314,
                  height: 46,
                  margin: EdgeInsets.only(left: 38, top: 13),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 0,
                        child: Container(
                          width: 314,
                          height: 46,
                          decoration: BoxDecoration(
                            color: AppColors.primaryElement,
                            borderRadius: Radii.k23pxRadius,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 21),
                                child: Text(
                                  "Members",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Source Sans Pro",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 108,
                        top: 0,
                        child: Container(
                          width: 128,
                          height: 28,
                          decoration: BoxDecoration(
                            border: Border.fromBorderSide(Borders.secondaryBorder),
                          ),
                          child: ListView.builder(
                            // ignore: missing_return
                            itemCount: 15, itemBuilder: (BuildContext context, int index) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 314,
                height: 46,
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: Radii.k23pxRadius,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 21),
                      child: Text(
                        "Location",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Source Sans Pro",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 94,
                      height: 22,
                      margin: EdgeInsets.only(right: 105),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter location",
                          contentPadding: EdgeInsets.all(0),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Source Sans Pro",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        autocorrect: false,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 314,
                height: 46,
                margin: EdgeInsets.only(bottom: 68),
                child: FlatButton(
                  onPressed: () => this.onDropboxPressed(context),
                  color: AppColors.primaryElement,
                  shape: RoundedRectangleBorder(
                    borderRadius: Radii.k23pxRadius,
                  ),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "Add",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
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