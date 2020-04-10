import 'package:flutter/foundation.dart';

class Item {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Item({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}
