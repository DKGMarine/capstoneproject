import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
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
                    title: Text(
                      inventory[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteItm(inventory[index].id),
                    ),
                  ),
                );
              },
              itemCount: inventory.length,
            ),
    );
  }
}
