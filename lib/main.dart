import 'package:cantina_app/screens/categories_screen.dart';
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
        secondaryHeaderColor: Colors.indigo
      ),
      home: MyHomePage(),
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
