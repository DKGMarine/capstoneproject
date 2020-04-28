import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/new_item.dart';
import '../widgets/inventory_list.dart';
import '../models/transaction.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scoutboard/color/colors.dart';
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

Future<List<Album>> createAlbum(String id) async {
  //ID = '25275';
  final http.Response response = await http.post(
      'https://scoutboard.appspot.com/inventory', // change this to what page you are requesting data from

      body: {
        'ScoutID': id,
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

Future addAlbum(String name, String price, String stock, String sold,
    String category, String typeOfM, String id) async {
  //ID = '25275';
  final http.Response response = await http.post(
      'https://scoutboard.appspot.com/addinventory', // change this to what page you are requesting data from

      body: {
        'Name': name,
        'Price': price,
        'Stock': stock,
        'Sold': sold,
        'Category': category,
        'Type_of_M': typeOfM,
        'ScoutID': id,
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

Future<Album> deleteAlbum(String id, String name) async {
  
  final http.Response response = await http.post(
      'https://scoutboard.appspot.com/inventoryDelete', // change this to what page you are requesting data from

      body: {
        'ID': id,
        'Name': name,
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
            icon: Icon(Icons.add), onPressed: () {
              
              Navigator.of(context).pushReplacement(

                MaterialPageRoute(

                  builder: (context) => NewInventory(),

                )
              );
          },

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
        onPressed: () {},
      ),
    );
  }
}

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
                          Text(
                              'Qty: ${widget.futureAlbum[index].stock} ${widget.futureAlbum[index].typeOfM}',
                              style: TextStyle(fontSize: 20)),
                          Text(
                              'Sold: ${widget.futureAlbum[index].sold} ${widget.futureAlbum[index].typeOfM}',
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () => deleteAlbum(
                            widget.futureAlbum[index].scoutID,
                            widget.futureAlbum[index].name),
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

class NewInventory extends StatefulWidget {


  @override
  _NewInventoryState createState() => _NewInventoryState();
}

class _NewInventoryState extends State<NewInventory> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  final _measurementController = TextEditingController();
  final _totalSoldController = TextEditingController();
  final _quantityController = TextEditingController();

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = _amountController.text;
    final enteredCategory = _categoryController.text;
    final enteredMeasurement = _measurementController.text;
    final enteredTotalSold = _totalSoldController.text;
    final enteredQuantity = _quantityController.text;

    if (enteredTitle.isEmpty ||
        enteredAmount.isEmpty ||
        enteredCategory.isEmpty ||
        enteredMeasurement.isEmpty ||
        enteredTotalSold.isEmpty ||
        enteredQuantity.isEmpty) {
      return;
    }

    print(enteredTitle);
    print(enteredAmount);
    print(enteredCategory);
    String response;
    addAlbum(
      enteredTitle,
      enteredAmount,
      enteredCategory,
      enteredMeasurement,
      enteredTotalSold,
      enteredQuantity,
      global.userID
    ).then((response){

      print('88');
      print(response);

    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        child: Container(
          color: Color.fromRGBO(40, 73, 100, 1),
          padding: EdgeInsets.all(10),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: AppColors.primaryText,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  controller: _titleController,
                ),
                TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Category',
                    labelStyle: TextStyle(
                      color: AppColors.primaryText,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  controller: _categoryController,
                ),
                TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Price',
                    labelStyle: TextStyle(
                      color: AppColors.primaryText,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    labelStyle: TextStyle(
                      color: AppColors.primaryText,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Unit of Measurement',
                    labelStyle: TextStyle(
                      color: AppColors.primaryText,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  controller: _measurementController,
                ),
                TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Total Sold',
                    labelStyle: TextStyle(
                      color: AppColors.primaryText,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  controller: _totalSoldController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 80),
                ButtonTheme(
                  minWidth: 150.0,
                  height: 50.0,
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0),
                    ),
                    child: Text('Add Inventory'),
                    color: AppColors.secondaryElement,
                    textColor: Theme.of(context).textTheme.button.color,
                    onPressed: _submitData,
                  ),
                ),
                SizedBox(height: 140),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
