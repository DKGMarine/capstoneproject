import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';



class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Dashboard'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Dashboard Screen'),
      ),
    );
  }
}
