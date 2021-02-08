import 'package:cantina_app/screens/categories_meals_screen.dart';
import 'package:cantina_app/screens/categories_screen.dart';
import 'package:cantina_app/screens/meal_item_screen.dart';
import 'package:cantina_app/screens/notifications_screen.dart';
import 'package:cantina_app/screens/orders_screen.dart';
import 'package:cantina_app/screens/profile_screen.dart';
import 'package:cantina_app/providers/products.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(CantinApp());

class CantinApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _CantinAppState createState() => _CantinAppState();
}

class _CantinAppState extends State<CantinApp> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (ctx) => Products(),
      child: MaterialApp(
        title: 'CantinApp',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          primaryColor: Colors.amber,
          //cardColor: Colors.amber.shade100,
          secondaryHeaderColor: Colors.indigo,
          fontFamily: 'Roboto',
          appBarTheme:
              AppBarTheme(color: Theme.of(context).scaffoldBackgroundColor),
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.amber,
          ),
          backgroundColor: Colors.amber.shade200,
          textTheme: TextTheme(
            display1: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.black87),
            display2: TextStyle(
                fontSize: 32.0, fontFamily: 'Roboto', color: Colors.black87),
            title: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.black87),
            display3: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.black87),
            display4: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Roboto',
                color: Colors.black87),
            button: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.indigo),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => CategoriesScreen(),
          CategoryMealsScreen.RouteName: (ctx) => CategoryMealsScreen(),
          MealItemScreen.RouteName: (ctx) => MealItemScreen(),
          NotificationsScreen.RouteName: (ctx) => NotificationsScreen(),
          OrdersScreen.RouteName: (ctx) => OrdersScreen(),
          ProfileScreen.RouteName: (ctx) => ProfileScreen(),
        },
      ),
    );
  }
}
