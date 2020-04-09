import 'package:flutter/material.dart';
import '../widgets/cell_two_item_widget.dart';
import '../widgets/cell_item_widget.dart';
import '../styles/style.dart';
import '../values/values.dart';

class GroupsScreen extends StatelessWidget {
  static const routeName = '/groups-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Groups'),
      ),
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
              /* child: FlatButton(
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
              ), */
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