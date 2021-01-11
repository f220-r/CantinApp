import 'package:cantina_app/data/meals_data.dart';
import 'package:cantina_app/widgets/meal_item_minimized.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const RouteName = '/category-meals';
  @override

  Widget build(BuildContext context) {
    final RouteArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final category_title = RouteArgs['title'];
    final category_id = RouteArgs['id'];
    final category_meals = MEALS.where((meal){
      if(category_id == '10')
        return true;
      else
        return (meal.category_id == category_id);}).toList();

    Widget NonEmptyCategory(BuildContext ctx){
      if(category_meals.length != 0)
        return ListView.builder(itemBuilder: (ctx, index){
          return MealMinItem(category_meals[index]);
        },
          itemCount: category_meals.length,
          itemExtent: 100.0,
        );
      else
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 80.0, left: 80.0, right: 80.0, bottom: 20.0),
              child: Image.asset('assets/images/non_cat.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Aún no hay alimentos disponibles en esta categoría :(", style: Theme.of(ctx).textTheme.title,),
            ),
          ],
        );
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(category_title),
        centerTitle: true,
      ),
      body:NonEmptyCategory(context),
    );
  }
}
