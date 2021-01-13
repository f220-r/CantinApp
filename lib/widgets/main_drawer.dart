import 'package:cantina_app/screens/notifications_screen.dart';
import 'package:cantina_app/screens/orders_screen.dart';
import 'package:cantina_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text("User name",
                  style: Theme.of(context).textTheme.display3),
              subtitle: Text('aa@gmail.com',
                  style: Theme.of(context).textTheme.subtitle),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.store,
                    size: 30.0,
                  ),
                  Expanded(child: SizedBox()),
                  Text("Menú", style: Theme.of(context).textTheme.display3)
                ],
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed(OrdersScreen.RouteName);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.bookmark,
                    size: 30.0,
                  ),
                  Expanded(child: SizedBox()),
                  Text("Mis Pedidos",
                      style: Theme.of(context).textTheme.display3)
                ],
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ProfileScreen.RouteName);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.person,
                    size: 30.0,
                  ),
                  Expanded(child: SizedBox()),
                  Text("Mi Perfil", style: Theme.of(context).textTheme.display3)
                ],
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed(NotificationsScreen.RouteName);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.notifications_none,
                    size: 30.0,
                  ),
                  Expanded(child: SizedBox()),
                  Text("Notificaciones",
                      style: Theme.of(context).textTheme.display3)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
