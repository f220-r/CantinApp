import 'package:cantina_app/data/meals_data.dart';
import 'package:flutter/material.dart';

class MealItemScreen extends StatefulWidget {
  static const RouteName = '/meal';
  @override
  _MealItemScreenState createState() => _MealItemScreenState();
}

class _MealItemScreenState extends State<MealItemScreen> {
  @override

  Widget CloseButton(BuildContext ctx){
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4.0),
          child: FlatButton(child: Icon(Icons.cancel,color: Colors.redAccent, size: 34.0),
            onPressed: (){
              Navigator.of(ctx).pop();
            },
          ),
        )
    );
  }
  Widget ImageNull(String input, BuildContext ctx){
    if(input != "" && input!= null)
      return Image.network(input,fit: BoxFit.fitWidth,);
    else
      return Container(
        alignment: Alignment.bottomRight,
        height: 100.0,
        width: MediaQuery.of(ctx).size.width,
        child: Text("Imagen no disponible", textAlign: TextAlign.end,style: Theme.of(context).textTheme.display2,),);
  }
  Widget build(BuildContext context) {
    final RouteArgs =
        ModalRoute.of(context).settings.arguments as String;
    final meal_item_id = RouteArgs;
    final selected_meal = MEALS.firstWhere((meal){return (meal.id == meal_item_id);});

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                ImageNull(selected_meal.image_path, context),
                CloseButton(context),
                ]
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: <Widget>[
                  Text(selected_meal.name, style: Theme.of(context).textTheme.display1,),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: SizedBox()),
                  Text('\$${selected_meal.amount}', style: Theme.of(context).textTheme.display2),
                ],
              ),
            ),
          ],
      ),
    );
  }
}
