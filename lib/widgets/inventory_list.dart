import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scoutboard/color/colors.dart';
import 'package:scoutboard/widgets/globals.dart' as global;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../screens/inventory_screen.dart';
import '../models/transaction.dart';



class InventoryList extends StatefulWidget {
  final List<Album> futureAlbum;
  
  InventoryList({Key key, this.futureAlbum}) : super(key: key);

  @override
  _InventoryListState createState() => _InventoryListState();
}

class _InventoryListState extends State<InventoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: widget.futureAlbum.isEmpty
          ? Container(
              alignment: Alignment(0.0, -0.3),
              child: Text(
                'No inventory added yet!',
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              ))
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Colors.blueGrey,
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text('\$${widget.futureAlbum[index].price}'),
                          ),
                        ),
                      ),
                      title: Text(widget.futureAlbum[index].name,
                          style: TextStyle(
                            fontSize: 25,
                            color: AppColors.primaryText,
                          )),
                      subtitle: Text(widget.futureAlbum[index].category,
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.primaryText,
                          )),
                      trailing: Column(
                        children: <Widget>[
                          Text('Qty: ${widget.futureAlbum[index].stock} ${widget.futureAlbum[index].typeOfM}',
                              style: TextStyle(fontSize: 20)),
                          Text(
                        'Sold: ${widget.futureAlbum[index].sold} ${widget.futureAlbum[index].typeOfM}',
                        style: TextStyle(fontSize: 20)
                        
                      ),
                        ],
                      ),
                    ),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () => deleteAlbum(widget.futureAlbum[index].scoutID, widget.futureAlbum[index].name),
                        
                      ),
                    ],
                  ),
                );
              },
              itemCount: widget.futureAlbum.length,
            ),
    );
  }
}
