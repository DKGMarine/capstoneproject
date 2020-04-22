import 'package:flutter/foundation.dart';

class Item {
  final String id;
  final String title;
  final String amount;
  final String category;
  final String measurement;
  final String totalSold;
  final String quantity;
 

  Item({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.category,
    @required this.measurement,
    @required this.totalSold,
    @required this.quantity,
  });
}
