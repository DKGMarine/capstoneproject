/*
*  cell_two_item_widget.dart
*  ScoutBoard
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:capstoneproject/settings_karla1_widget/settings_karla1_widget.dart';
import 'package:capstoneproject/values/values.dart';


class CellTwoItemWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Container(
      constraints: BoxConstraints.expand(height: 44),
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        border: Border.all(
          width: 1,
          color: Color.fromARGB(255, 45, 62, 79),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 148, top: 13),
            child: Text(
              "GROUP 1",
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
    );
  }
}