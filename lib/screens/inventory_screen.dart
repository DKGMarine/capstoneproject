import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/new_item.dart';
import '../widgets/inventory_list.dart';
import '../models/transaction.dart';
import 'package:scoutboard/widgets/globals.dart' as global;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

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

  Album(
      {this.name,
      this.price,
      this.stock,
      this.sold,
      this.category,
      this.typeOfM,
      this.scoutID});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['Name'],
      price: json['Price'],
      stock: json['Stock'],
      sold: json['Sold'],
      category: json['Category'],
      typeOfM: json['Measurement'],
      scoutID: json['ScoutID'],
    );
  }
}

List<Album> parseAlbums(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
}

Future<List<Album>> createAlbum(String ID) async {
  ID = '25275';
  final http.Response response = await http.post(
      'https://capstoneproject-271322.appspot.com/inventory', // change this to what page you are requesting data from

      body: {
        'ScoutID': ID,
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.

    print('1');
    print(json.decode(response.body));
    try {
      return compute(parseAlbums, response.body);
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

Future addAlbum(String Name, String Price, String Stock,
    String Sold, String Category, String Type_Of_M, String ID) async {
  ID = '25275';
  final http.Response response = await http.post(
      'https://capstoneproject-271322.appspot.com/addinventory', // change this to what page you are requesting data from

      body: {
        'Name': Name,
        'Price': Price,
        'Stock': Stock,
        'Sold': Sold,
        'Category': Category,
        'Type_of_M': Type_Of_M,
        'ScoutID': ID,
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.

    print('1');
    print(json.decode(response.body));
    return response.body;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Album> deleteAlbum(String ID, String Name) async {
  ID = '25275';
  final http.Response response = await http.post(
      'https://capstoneproject-271322.appspot.com/inventoryDelete', // change this to what page you are requesting data from

      body: {
        'ID': ID,
        'Name': Name,
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    print(json.decode(response.body));
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to delete album');
  }
}

class InventoryScreen extends StatefulWidget {
  static const routeName = '/inventory-screen';
  InventoryScreen({Key key}) : super(key: key);

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
   

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
            //onPressed: () => _startAddNewInventory(context),
          ),
        ],
      ),
      body: FutureBuilder<List<Album>>(
          future: createAlbum(global.userID),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          InventoryList(
                            futureAlbum: snapshot.data,
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(child: CircularProgressIndicator());
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        //onPressed: () => _startAddNewInventory(context),
      ),
    );
  }
}
