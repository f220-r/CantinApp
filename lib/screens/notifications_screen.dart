import 'package:cantina_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  static const RouteName = '/notifications';

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
