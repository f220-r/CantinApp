import 'package:cantina_app/screens/categories_meals_screen.dart';
import 'package:cantina_app/screens/categories_screen.dart';
import 'package:cantina_app/screens/meal_item_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(CantinApp());

class CantinApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CantinApp',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.amber,
        secondaryHeaderColor: Colors.indigo,
        fontFamily: 'Roboto',
        appBarTheme: AppBarTheme(color: Theme.of(context).scaffoldBackgroundColor),
        backgroundColor: Colors.amber.shade200,
        textTheme: TextTheme(
            display1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,fontFamily: 'Roboto' , color: Colors.black87),
          display2: TextStyle(fontSize: 32.0, fontFamily: 'Roboto' , color: Colors.black87),
        ),
      ),
//      home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/' : (ctx) => CategoriesScreen(),
        CategoryMealsScreen.RouteName : (ctx) => CategoryMealsScreen() ,
        MealItemScreen.RouteName : (ctx) => MealItemScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CategoriesScreen();
  }
}
