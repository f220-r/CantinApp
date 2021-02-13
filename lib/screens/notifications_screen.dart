import 'package:cantina_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  static const RouteName = '/notifications';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notificaciones"),
      ),
      drawer: MainDrawer(),
      body: Container(),
    );
  }
}
