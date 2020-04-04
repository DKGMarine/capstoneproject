/*
*  side_bar_weston3_widget.dart
*  ScoutBoard
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:capstoneproject/calendar_karla_widget/calendar_karla_widget.dart';
import 'package:capstoneproject/dashboard_weston_widget/dashboard_weston_widget.dart';
import 'package:capstoneproject/events_weston_widget/events_weston_widget.dart';
import 'package:capstoneproject/groups_karla_widget/groups_karla_widget.dart';
import 'package:capstoneproject/inventory_josh_widget/inventory_josh_widget.dart';
import 'package:capstoneproject/login_weston_widget/login_weston_widget.dart';
import 'package:capstoneproject/settings_karla_widget/settings_karla_widget.dart';
import 'package:capstoneproject/values/values.dart';


class SideBarWeston3Widget extends StatelessWidget {
  
  void onViewPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => GroupsKarlaWidget()));
  
  void onSettingsPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsKarlaWidget()));
  
  void onCalendarPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarKarlaWidget()));
  
  void onCustomersPressed(BuildContext context) {
  
  }
  
  void onInvoicesPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => EventsWestonWidget()));
  
  void onProductsPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => InventoryJoshWidget()));
  
  void onDashboardPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardWestonWidget()));
  
  void onBackwardArrowPressed(BuildContext context) {
    Navigator.pop(context);
  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 40, 73, 100),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 50,
                height: 100,

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
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 53,
              margin: EdgeInsets.only(top: 8),
              child: FlatButton(
                onPressed: () => this.onDashboardPressed(context),
                color: Color.fromARGB(0, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                textColor: Color.fromARGB(255, 255, 255, 255),
                padding: EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/icon-dashboard.png",),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Dashboard",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontFamily: "Source Sans Pro",
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 104,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: FlatButton(
                      onPressed: () => this.onViewPressed(context),
                      color: Color.fromARGB(0, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/icon-customers.png",),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Groups",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Source Sans Pro",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 51,
                    right: 0,
                    child: FlatButton(
                      onPressed: () => this.onProductsPressed(context),
                      color: Color.fromARGB(0, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/icon-products.png",),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Inventory",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Source Sans Pro",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 105,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 52,
                    right: 0,
                    child: FlatButton(
                      onPressed: () => this.onCustomersPressed(context),
                      color: Color.fromARGB(0, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/union-43.png",),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Statistics",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Source Sans Pro",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: FlatButton(
                      onPressed: () => this.onInvoicesPressed(context),
                      color: Color.fromARGB(0, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/icon-invoices.png",),
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            "Events",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Source Sans Pro",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 105,
              margin: EdgeInsets.only(top: 6),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 52,
                    right: 0,
                    child: FlatButton(
                      onPressed: () => this.onSettingsPressed(context),
                      color: Color.fromARGB(0, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/icon-setting.png",),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Settings",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Source Sans Pro",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: FlatButton(
                      onPressed: () => this.onCalendarPressed(context),
                      color: Color.fromARGB(0, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/icon-calendar.png",),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Calendar",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Source Sans Pro",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
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
                "assets/images/sidebarbg.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}