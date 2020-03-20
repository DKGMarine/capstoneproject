/*
*  inventory_adding_item_widget.dart
*  ScoutBoard
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:capstoneproject/inventory_josh_widget/inventory_josh_widget.dart';
import 'package:capstoneproject/side_bar_weston3_widget/side_bar_weston3_widget.dart';
import 'package:capstoneproject/values/values.dart';


class InventoryAddingItemWidget extends StatelessWidget {
  
  void onBackwardArrowPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => SideBarWeston3Widget()));
  
  void onDropboxPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => InventoryJoshWidget()));
  
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
                  "Add Item",
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
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 31, top: 11, right: 30, bottom: 20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryElement,
                          borderRadius: Radii.k23pxRadius,
                        ),
                        child: Container(),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 11,
                      right: 24,
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
                          Spacer(),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 134,
                              height: 19,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Enter name",
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.w300,
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
              height: 46,
              margin: EdgeInsets.only(left: 32, top: 20, right: 29),
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
                    left: 19,
                    top: 11,
                    right: 60,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Category",
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
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 99,
                            height: 22,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter category",
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
            Container(
              height: 46,
              margin: EdgeInsets.only(left: 31, top: 22, right: 30),
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
                    left: 20,
                    top: 11,
                    right: 25,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Price",
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
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 132,
                            height: 22,
                            margin: EdgeInsets.only(top: 1),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter price per item",
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
            Container(
              height: 46,
              margin: EdgeInsets.only(left: 32, top: 31, right: 29),
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
                    left: 19,
                    top: 10,
                    right: 25,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Measurement",
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
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 133,
                            height: 22,
                            margin: EdgeInsets.only(top: 2),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter measurement",
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
            Container(
              height: 46,
              margin: EdgeInsets.only(left: 31, top: 21, right: 30),
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
                    left: 20,
                    top: 11,
                    right: 65,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Amount",
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
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 92,
                            height: 22,
                            margin: EdgeInsets.only(top: 2),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter amount",
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
            Align(
              alignment: Alignment.topCenter,
              child: Container(
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
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}