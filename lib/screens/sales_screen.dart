import 'package:flutter/material.dart';
import '../color/colors.dart';

class SalesScreen extends StatefulWidget {
  static const routeName = '/sales-screen';
  // String titleInput;
  // String amountInput;
  @override
  _SalesScreenState createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Sales',
        ),
        
      ),
    );
  }
}
