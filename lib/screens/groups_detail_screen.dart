
import 'package:flutter/material.dart';
class GroupdetailWidget extends StatelessWidget{
  final int index;
  //final String ctxt;
  GroupdetailWidget(this.index);
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Groups'),
      ),
      body: Center(
        child: Text('Group $index'),
      ),
    );
  }


}