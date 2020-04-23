import 'package:flutter/material.dart';
import '../widgets/new_item.dart';
import '../widgets/inventory_list.dart';
import '../models/transaction.dart';
import 'package:scoutboard/widgets/globals.dart' as global;
import 'package:http/http.dart' as http;
import 'dart:convert';

/*
ADDING:

Page: 'addinventory'

'Name':
'Price':
'Stock':
'Sold':
'Category':
'Type_of_M':
'ScoutID':
 */

/*
DELETING:

Page: 'inventoryDelete'

'Name':
'ID':
 */

/*
RETURNING INVENTORY:

Page: 'inventory'

'ScoutID':
*/

class Album {
  // change this to parse what data you need

  final String name;
  final String price;
  final String stock;
  final String sold;
  final String category;
  final String typeOfM;
  final String scoutID;

  Album({this.name,this.price,this.stock,this.sold,this.category,this.typeOfM,this.scoutID});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['Name'],
      price: json['Price'],
      stock: json['Stock'],
      sold: json['Sold'],
      category: json['Category'],
      typeOfM: json['Type_of_M'],
      scoutID: json['ScoutID'],
    );
  }
}

Future<Album> createAlbum(String ID) async {
  final http.Response response = await http.post(
      'https://capstoneproject-271322.appspot.com/inventory', // change this to what page you are requesting data from

      body: {
        'ID': global.userID,
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.

    try {
      return Album.fromJson(json.decode(response.body));
    } catch (err) {
      print("Error in returning album");
      return null;
    }
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class InventoryScreen extends StatefulWidget {
  static const routeName = '/inventory-screen';
  // String titleInput;
  // String amountInput;
  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  Future<Album> futureAlbum;
  final List<Item> _userInventory = [

  ];

  void _addNewInventory(String itmTitle, String itmAmount, String itmCategory, String itmMeasurement, String itmQuantity, String itmTotalSold) {
    final newItm = Item(
      title: itmTitle,
      amount: itmAmount,
      category: itmCategory,
      measurement: itmMeasurement,
      quantity: itmQuantity,
      totalSold: itmTotalSold,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userInventory.add(newItm);
    });
  }

  void _startAddNewInventory(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Color.fromRGBO(255, 0, 0, 0.0),
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewInventory(_addNewInventory),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteInventory(String id) {
    setState(() {
      _userInventory.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Inventory',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewInventory(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              InventoryList(_userInventory, _deleteInventory),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewInventory(context),
      ),
    );
  }
}
