import 'package:cantina_app/models/meal.dart';
import 'package:cantina_app/providers/products.dart';
import 'package:cantina_app/widgets/has_choice.dart';
import 'package:cantina_app/widgets/multi_choice_chip.dart';
import 'package:cantina_app/widgets/order_quantity.dart';
import 'package:cantina_app/widgets/add_ons_meal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class MealItemScreen extends StatefulWidget {
  static const RouteName = '/meal';

  @override
  _MealItemScreenState createState() => _MealItemScreenState();
}

class _MealItemScreenState extends State<MealItemScreen> {
  Meal side_d = null;
  Meal bev = null;
  Meal dessert = null;

  int qtty = 1;
  List<String> remove_ingredients = [];
  String choices = "";

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
    final selected_meal =
    Provider.of<Products>(context, listen: false).findId(RouteArgs);
    double final_cost = (selected_meal.amount +
        ((bev != null) ? bev.amount : 0.0) +
        ((dessert != null) ? dessert.amount : 0.0) +
        ((side_d != null) ? side_d.amount : 0.0)) * qtty;
    var order = {
      "items": [selected_meal,],
      "remove_ingredients": remove_ingredients,
      "cost": final_cost,
      "qtty": qtty,
      "has_choices": (selected_meal.has_choice != null),
      "choice": choices,
    };
    //TODO pasar estos ingredientes selecionados a pedido
    List<String> selected_ingredients;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
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
                        style: Theme
                            .of(context)
                            .textTheme
                            .display1,
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
                    style: Theme
                        .of(context)
                        .textTheme
                        .display4,
                  ),
                ),
                //------------------------------------------------------------------Meal Price
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: SizedBox()),
                      Text('\$' + selected_meal.amount.toString(),
                          style: Theme
                              .of(context)
                              .textTheme
                              .display2),
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
                        remove_ingredients =
                            selected_meal.ingredients.where((x) {
                              return !(selected_ingredients.contains(x));
                            }).toList();
                      });
                    },
                  ),
                if (selected_meal.has_choice != null)
                  HasChoice(
                      selected_meal.choices_amount, selected_meal.has_choice,
                          (val) {
                        setState(() {
                          choices = val;
                        });
                      }),
                //------------------------------------------------------------------Order Quantity
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OrderQuantity((val) {
                    setState(() {
                      qtty = val;
                    });
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
                  child: SideDish((val) {
                    setState(() {
                      side_d = val;
                    });
                  }),
                ),
                //------------------------------------------------------------------Beverage
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Beverage((val) {
                    setState(() {
                      bev = val;
                    });
                  }),
                ),
                //------------------------------------------------------------------Dessert
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Dessert((val) {
                    setState(() {
                      dessert = val;
                    });
                  }),
                ),
                //------------------------------------------------------------------Order info, send order
                SizedBox(height: 50.0,),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              height: 50.0,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(35))
                  ),
                  color: Colors.amber,
                  child: Text("Hacer Pedido (\$$final_cost)",
                      textAlign: TextAlign.center),
                  onPressed: () {
                    List<Meal> aux = [selected_meal];
                    if (side_d != null)
                      aux.add(side_d);
                    if (dessert != null)
                      if (dessert != null)
                        aux.add(dessert);
                    if (bev != null)
                      aux.add(bev);
                    order["items"] = aux;
                    print(order);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
