/*
*  groups_karla_widget.dart
*  ScoutBoard
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:capstoneproject/groups_karla_widget/cell_item_widget.dart';
import 'package:capstoneproject/groups_karla_widget/cell_two_item_widget.dart';
import 'package:capstoneproject/side_bar_weston3_widget/side_bar_weston3_widget.dart';
import 'package:capstoneproject/styles/style.dart';
import 'package:capstoneproject/values/values.dart';


class GroupsKarlaWidget extends StatelessWidget {
  
  void onButtonPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => SideBarWeston3Widget()));
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 40, 73, 100),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 22,
              height: 18,
              margin: EdgeInsets.only(left: 7, top: 13),
              child: FlatButton(
                onPressed: () => this.onButtonPressed(context),
                color: Color.fromARGB(0, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                textColor: Color.fromARGB(255, 255, 255, 255),
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
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 375,
              height: 625,
              margin: EdgeInsets.only(top: 10),
              child: Style(
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) => CellTwoItemWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}