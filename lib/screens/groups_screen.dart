import 'package:flutter/material.dart';
import '../widgets/cell_two_item_widget.dart';
import '../widgets/cell_item_widget.dart';
import '../styles/style.dart';
import '../values/values.dart';
import 'package:scoutboard/screens/groups_detail_screen.dart';
class GroupsScreen extends StatefulWidget{
  static const routeName = '/groups-screen';
  @override
  State<StatefulWidget> createState() {
    return GroupsScreenState();
  }

}

class GroupsScreenState extends State<GroupsScreen>{
  
  List<String> item = [];
  final TextEditingController eCtrl = new TextEditingController();
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Groups'),
      ),
      body: new Column(
        children: <Widget>[
          new TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
              prefixIcon: Icon(Icons.add),
              hintText: 'Enter Group Name',
              filled:true,

            ),
            controller: eCtrl,
            onSubmitted: (text){
              item.add(text);
              eCtrl.clear();
              setState(() {});
            },
          ),
          new Expanded(
            child: new ListView.builder(
              itemCount: item.length,
              itemBuilder: (BuildContext ctxt, int index){
                return new Card(
                  child: ListTile(
                    title: Text(item[index]),
                    onTap: (){
                      Navigator.push(
                        ctxt,
                        MaterialPageRoute(builder: (ctxt) => GroupdetailWidget(index))
                      );
                    },
                  ),
                  
                );
                
              }
              
              )
            )
        ],

      )

    );

  }


}