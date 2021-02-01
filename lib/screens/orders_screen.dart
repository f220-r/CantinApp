import 'package:cantina_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  static const RouteName = '/my-orders';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      drawer: MainDrawer(),
      body: Container(),
    );
  }
}
