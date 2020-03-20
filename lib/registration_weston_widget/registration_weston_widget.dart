/*
*  registration_weston_widget.dart
*  ScoutBoard
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:capstoneproject/login_weston_widget/login_weston_widget.dart';
import 'package:capstoneproject/values/values.dart';


class RegistrationWestonWidget extends StatelessWidget {
  
  void onRectangle14Pressed(BuildContext context) {
  
  }
  
  void onBackwardArrowPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWestonWidget()));
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 250, 250, 250),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
              left: -1,
              top: -122,
              right: -5,
              bottom: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 269,
                          margin: EdgeInsets.only(left: 1),
                          child: Image.asset(
                            "assets/images/stars-5-4.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(top: 251, right: 5),
                            child: Image.asset(
                              "assets/images/stars-5-3.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 142,
                    right: 5,
                    bottom: 257,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 15, right: 344, bottom: 72),
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
                                  Image.asset("assets/images/backward-arrow-4.png",),
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
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: EdgeInsets.only(top: 72),
                            child: Text(
                              "Create New Account",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w300,
                                fontSize: 27,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            "assets/images/stars-5.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 39,
                    top: 329,
                    right: 42,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 18,
                          margin: EdgeInsets.only(left: 13, right: 223),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 12,
                                    margin: EdgeInsets.only(top: 3, right: 13),
                                    child: Image.asset(
                                      "assets/images/group-2.png",
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 13),
                                    child: Text(
                                      "Name",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.primaryText,
                                        fontFamily: "Ubuntu",
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                      ),
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
                            width: 60,
                            height: 18,
                            margin: EdgeInsets.only(left: 13, top: 43),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 13,
                                    height: 12,
                                    child: Image.asset(
                                      "assets/images/group-2.png",
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 12),
                                    child: Text(
                                      "Email",
                                      textAlign: TextAlign.center,
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
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 38, top: 36),
                            child: Text(
                              "Password",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 51,
                          margin: EdgeInsets.only(top: 53),
                          child: FlatButton(
                            onPressed: () => this.onRectangle14Pressed(context),
                            color: AppColors.secondaryElement,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            textColor: Color.fromARGB(255, 255, 255, 255),
                            padding: EdgeInsets.all(0),
                            child: Text(
                              "Create Account",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 39,
                    top: 347,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 300,
                            height: 23,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 130, 196, 31),
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(9)),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "",
                                contentPadding: EdgeInsets.only(left: 12, top: 5),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                              ),
                              maxLines: 1,
                              autocorrect: false,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 300,
                            height: 23,
                            margin: EdgeInsets.only(top: 38),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 130, 196, 31),
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(9)),
                            ),
                            child: TextField(
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                              ),
                              maxLines: 1,
                              autocorrect: false,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 300,
                            height: 24,
                            margin: EdgeInsets.only(top: 35),
                            decoration: BoxDecoration(
                              border: Border.fromBorderSide(Borders.primaryBorder),
                              borderRadius: BorderRadius.all(Radius.circular(9)),
                            ),
                            child: TextField(
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
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
              left: 55,
              child: Image.asset(
                "assets/images/union-7.png",
                fit: BoxFit.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}