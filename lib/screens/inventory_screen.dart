import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  static const routeName = '/inventory-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Inventory'),
      ),
      body: Center(
        child: Text(
          'The Inventory Page!',
        ),
      ),
    );
  }
}