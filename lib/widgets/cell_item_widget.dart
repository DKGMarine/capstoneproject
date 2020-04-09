/*
*  cell_item_widget.dart
*  ScoutBoard
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
//import 'package:capstoneproject/settings_karla1_widget/settings_karla1_widget.dart';
import '../values/values.dart';


class CellItemWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Container(
      constraints: BoxConstraints.expand(height: 44),
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 13,
            margin: EdgeInsets.only(left: 175, top: 9),
            child: Text(
              "+",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w300,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}