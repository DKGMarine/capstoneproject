// Sales Screen
// Displays list of inventory items, when you slide an item it allows you to add
// a sale to the specified item. It does not allow more items to be sold than
// there are in stock.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scoutboard/color/colors.dart';
import 'package:scoutboard/widgets/globals.dart' as global;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'dashboard_screen.dart';

// global variables so they can be passed between functions
String name;
String price;
String stock;
String sold;
String category;
String typeOfM;
String id;

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

//
class SalesScreen extends StatefulWidget {
  static const routeName = '/sales-screen';
  SalesScreen({Key key}) : super(key: key);

  @override
  _SalesScreenState createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(StatefulWidgetReg.routeName);
            }),
        elevation: 0,
        title: Text(
          'Sales',
        ),
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
                    SalesList(
                      futureAlbum: snapshot.data,
                    ),
                  ],
                ),
              ),
            )
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class SalesList extends StatefulWidget {
  static const routeName = '/sales-screen';
  final List<Album> futureAlbum;

  SalesList({Key key, this.futureAlbum}) : super(key: key);

  @override
  _SalesListState createState() => _SalesListState();
}

class _SalesListState extends State<SalesList> {
  String enteredTotalSold;

  void _startAddNewEvent(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Color.fromRGBO(255, 0, 0, 0.0),
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewSale(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

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
                      fontSize: 20,
                      color: AppColors.primaryText,
                    )),
                subtitle: Text(widget.futureAlbum[index].category,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.primaryText,
                    )),
                trailing: Column(
                  children: <Widget>[
                    SizedBox(height: 4),
                    Text(
                      'Qty: ${widget.futureAlbum[index].stock} ${widget.futureAlbum[index].typeOfM}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Sold: ${widget.futureAlbum[index].sold} ${widget.futureAlbum[index].typeOfM}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              secondaryActions: <Widget>[
                IconSlideAction( // slide an inventory item to add sale
                    caption: 'Add Sale',
                    color: Colors.green,
                    icon: Icons.attach_money,
                    onTap: () {
                      // first remove the item, will be added again with only to total sold changed
                      deleteAlbum(widget.futureAlbum[index].scoutID, widget.futureAlbum[index].name).then((futureAlbum) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed(SalesList.routeName);
                      }
                      ).catchError((e){

                      });

                      // change global variables to pass kept information to newSale
                      name = widget.futureAlbum[index].name;
                      price = widget.futureAlbum[index].price;
                      stock = widget.futureAlbum[index].stock;
                      sold = widget.futureAlbum[index].sold;
                      category = widget.futureAlbum[index].category;
                      typeOfM = widget.futureAlbum[index].typeOfM;
                      id = widget.futureAlbum[index].scoutID;

                      // start the event to add new sale information
                      setState(() {
                        _startAddNewEvent(context);
                      });
                    }),
              ],
            ),
          );
        },
        itemCount: widget.futureAlbum.length,
      ),
    );
  }
}

class NewSale extends StatefulWidget {
  @override
  _NewSalesState createState() => _NewSalesState();
}

class _NewSalesState extends State<NewSale> {
  final _totalSoldController = TextEditingController();


  void _submitData() {
    final enteredTotalSold = _totalSoldController.text;

    // need to convert to ints to compare
    var oldAmnt = int.parse(stock);
    var amntSold = int.parse(enteredTotalSold);
    var total = int.parse(sold);
    var diff = oldAmnt - amntSold;  // used to test if there is enough stock
    total = total + amntSold; // add on new amount sold to previous amount sold

    // convert back to string to output
    final String difference = diff.toString();
    final String totalSold = total.toString();

    // check if enough in stock, and that amount sold isn't negative
    if(diff >= 0 && total >= 0) {
      addAlbum(
          name,
          price,
          difference,
          totalSold,
          category,
          typeOfM, /*global.userID*/
          id)
          .then((response) {
        print('88');
        print(response);
      });
      Navigator.of(context).pop();
    }
    else { // if not enough stock, restore previous information
      addAlbum(
          name,
          price,
          stock,
          sold,
          category,
          typeOfM, /*global.userID*/
          id)
          .then((response) {
        print('88');
        print(response);
      });
      Navigator.of(context).pop();
    }
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
                    child: Text('Add Sale'),
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
