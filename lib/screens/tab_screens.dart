import 'package:cantina_app/screens/categories_screen.dart';
import 'package:cantina_app/screens/notifications_screen.dart';
import 'package:cantina_app/screens/orders_screen.dart';
import 'package:cantina_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': "Menu"},
    {'page': OrdersScreen(), 'title': "Mis Pedidos"},
    {'page': ProfileScreen(), 'title': "Mi Cuenta"},
    {'page': NotificationsScreen(), 'title': "Notificaciones"},
  ];
  int _selected_page_index = 0;

  void _select_page(int index) {
    setState(() {
      _selected_page_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, //4 tabs: Mi cuenta, Menu, Mis Pedidos, Notificaciones
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height / 15),
          child: AppBar(
            elevation: 0.0,
          ),
        ),
        drawer: Drawer(
          elevation: 2.0,
          child: Text('data'),
        ),
        body: _pages[_selected_page_index]['page'],
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black87,
            selectedItemColor: Colors.amber,
            onTap: _select_page,
            currentIndex: _selected_page_index,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.store,
                ),
                title: Text(_pages[_selected_page_index]['title']),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                title: Text(_pages[_selected_page_index]['title']),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(_pages[_selected_page_index]['title']),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none),
                title: Text(_pages[_selected_page_index]['title']),
              ),
            ]),
      ),
    );
  }
}
