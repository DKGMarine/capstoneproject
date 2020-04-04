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
  
  void onRectangle14Pressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWestonWidget()));
  
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
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              left: -1,
              top: -50,
              right: -1,
              child: Image.asset(
                "assets/images/registration_background.png",
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              left: 0,
              top: 50,
              right: 370,
              child: Container(
                width: 10,
                height: 17,
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

                    ],
                  ),
                ),
              ),
            ),
              Positioned(
                left: 0,
                top: 80,
                right: 0,
              child: Container(
                margin: EdgeInsets.only(),
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
            Positioned(
              left: -1,
              top: 80,
              right: -1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 49,
                      height: 18,
                      margin: EdgeInsets.only(left: 47, top: 100),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 14,
                              height: 12,
                              margin: EdgeInsets.only(top: 2),
                              child: Image.asset(
                                "assets/images/group-2-2.png",
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 320,
                      height: 27,
                      margin: EdgeInsets.only(top: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
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
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 73,
                      height: 18,
                      margin: EdgeInsets.only(left: 48, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 8,
                              height: 12,
                              margin: EdgeInsets.only(top: 4),
                              child: Image.asset(
                                "assets/images/union-7.png",
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 3),
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 320,
                      height: 24,
                      margin: EdgeInsets.only(top: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),

                      ),
                      child: TextField(
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                        ),
                        obscureText: true,
                        maxLines: 1,
                        autocorrect: false,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 250,
                      height: 18,
                      margin: EdgeInsets.only(left: 48, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 8,
                              height: 12,
                              margin: EdgeInsets.only(top: 4),
                              child: Image.asset(
                                "assets/images/union-7.png",
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 3),
                              child: Text(
                                "Confirm Password",
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
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 320,
                      height: 24,
                      margin: EdgeInsets.only(top: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),

                      ),
                      child: TextField(
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                        ),
                        obscureText: true,
                        maxLines: 1,
                        autocorrect: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 38,
              top: 425,
              right: 38,
              bottom: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 300,
                    height: 42,
                    child: FlatButton(
                      onPressed: () => this.onRectangle14Pressed(context),
                      color: AppColors.secondaryElement,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.all(0),
                      child: Text(
                        "REGISTER",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold,
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
    );
  }
}