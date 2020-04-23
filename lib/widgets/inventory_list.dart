import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scoutboard/color/colors.dart';

import '../models/transaction.dart';

class InventoryList extends StatelessWidget {
  final List<Item> inventory;
  final Function deleteItm;

  InventoryList(this.inventory, this.deleteItm);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: inventory.isEmpty
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
                            child: Text('\$${inventory[index].amount}'),
                          ),
                        ),
                      ),
                      title: Text(inventory[index].title,
                          style: TextStyle(
                            fontSize: 25,
                            color: AppColors.primaryText,
                          )),
                      subtitle: Text(inventory[index].category,
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.primaryText,
                          )),
                      trailing: Column(
                        children: <Widget>[
                          Text('Qty: ${inventory[index].quantity} ${inventory[index].measurement}',
                              style: TextStyle(fontSize: 20)),
                          Text(
                        'Sold: ${inventory[index].totalSold} ${inventory[index].measurement}',
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
                        onTap: () => deleteItm(inventory[index].id),
                      ),
                    ],
                  ),
                );
              },
              itemCount: inventory.length,
            ),
    );
  }
}
