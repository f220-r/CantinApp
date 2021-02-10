import 'package:cantina_app/providers/products.dart';
import 'package:cantina_app/widgets/beverage.dart';
import 'package:cantina_app/widgets/desserts.dart';
import 'package:cantina_app/widgets/has_choice.dart';
import 'package:cantina_app/widgets/multi_choice_chip.dart';
import 'package:cantina_app/widgets/order_quantity.dart';
import 'package:cantina_app/widgets/side_dish.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealItemScreen extends StatefulWidget {
  static const RouteName = '/meal';

  @override
  _MealItemScreenState createState() => _MealItemScreenState();
}

class _MealItemScreenState extends State<MealItemScreen> {
  int _value;

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
    final RouteArgs = ModalRoute.of(context).settings.arguments as String;
    final selected_meal =
        Provider.of<Products>(context, listen: false).findId(RouteArgs);
    var order = {
      "items": [
        selected_meal,
      ],
      "remove_ingredients": [],
      "cost": selected_meal.amount,
      "qtty": 1,
      "has_choices": false,
      "choice": "",
    };
    //TODO pasar estos ingredientes selecionados a pedido
    List<String> selected_ingredients;
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ImageNull(selected_meal.image_path, context),
            SizedBox(
              height: 20.0,
            ),
            //------------------------------------------------------------------Meal Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    selected_meal.name,
                    style: Theme.of(context).textTheme.display1,
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
            //------------------------------------------------------------------Meal Description
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                selected_meal.description,
                style: Theme.of(context).textTheme.display4,
              ),
            ),
            //------------------------------------------------------------------Meal Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: SizedBox()),
                  Text('\$' + selected_meal.amount.toString(),
                      style: Theme.of(context).textTheme.display2),
                ],
              ),
            ),
            //------------------------------------------------------------------Meal Ingredients
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Ingredientes:",
                      style: Theme
                          .of(context)
                          .textTheme
                          .display3),
                  Text("(pulsa para remover ingredientes)",
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle),
                ],
              ),
            ),
            if (selected_meal.ingredients != null)
              MultiSelectChip(
                selected_meal.ingredients,
                onSelectionChanged: (selectedList) {
                  setState(() {
                    selected_ingredients = selectedList;
                    order["remove_ingredients"] =
                        selected_meal.ingredients.where((x) {
                      return !(selected_ingredients.contains(x));
                    }).toList();
                  });
                },
              ),
            if (selected_meal.has_choice != null)
              HasChoice(selected_meal.choices_amount, selected_meal.has_choice,
                  (val) {
                setState(() {
                  order["has_choices"] = true;
                  order["choice"] = val;
                  print(order["choice"]);
                });
              }),
            //------------------------------------------------------------------Order Quantity
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OrderQuantity((val) {
                order['qtty'] = val;
              }),
            ),

            Divider(
              thickness: 3.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            //------------------------------------------------------------------Side Dish
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SideDish(),
            ),
            //------------------------------------------------------------------Beverage
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Beverage(),
            ),
            //------------------------------------------------------------------Dessert
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Dessert(),
            ),
            //------------------------------------------------------------------Order info, send order
          ],
        ),
      ),
    );
  }
}
