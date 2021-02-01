import 'package:cantina_app/data/meals_data.dart';
import 'package:flutter/material.dart';

class MealItemScreen extends StatefulWidget {
  static const RouteName = '/meal';
  @override
  _MealItemScreenState createState() => _MealItemScreenState();
}

class _MealItemScreenState extends State<MealItemScreen> {
  @override
  Widget CloseButton(BuildContext ctx) {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4.0),
          child: FlatButton(
            child: Icon(Icons.cancel, color: Colors.red, size: 34.0),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ));
  }

  Widget ImageNull(String input, BuildContext ctx) {
    if (input != "" && input != null)
      return Stack(alignment: Alignment.topCenter, children: <Widget>[
        Image.network(
          input,
          fit: BoxFit.fitWidth,
        ),
        Align(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 26.5, horizontal: 35.5),
              child: Icon(Icons.close, color: Colors.black, size: 25.0),
            ),
            alignment: Alignment.topLeft),
        CloseButton(context),
      ]);
    else
      return FlatButton(
        child: Align(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 26.5),
            child: Icon(Icons.arrow_back, color: Colors.black, size: 34.0),
          ),
          alignment: Alignment.topLeft,
        ),
        onPressed: () {
          Navigator.of(ctx).pop();
        },
      );
  }

  Widget build(BuildContext context) {
    final RouteArgs = ModalRoute
        .of(context)
        .settings
        .arguments as String;
    final meal_item_id = RouteArgs;
    final selected_meal = MEALS.firstWhere((meal) {
      return (meal.id == meal_item_id);
    });

    return Container(
      color: Theme
          .of(context)
          .scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ImageNull(selected_meal.image_path, context),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Text(
                  selected_meal.name,
                  style: Theme
                      .of(context)
                      .textTheme
                      .display1,
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(child: SizedBox()),
                Text('\$${selected_meal.amount}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .display2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
