import 'package:cantina_app/models/meal.dart';
import 'package:cantina_app/providers/cart.dart';
import 'package:cantina_app/providers/order_h.dart';
import 'package:cantina_app/providers/products.dart';
import 'package:cantina_app/widgets/confirm_order.dart';
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
  bool f = false;

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

  OrderHelp initialize(OrderHelp order_h, Meal selected_meal) {
    order_h.selected_meal = selected_meal;

    order_h.side_d = null;
    order_h.bev = null;
    order_h.dessert = null;

    order_h.remove_ingredients = [];
    order_h.choices = "//Opcion no elegida";
    order_h.qtty = 1;

    order_h.opts = selected_meal.choices_amount;
    order_h.choice = selected_meal.has_choice;
    order_h.qties = [];
    order_h.final_cost = selected_meal.amount;
    return order_h;
  }

  Widget build(BuildContext context) {
    final RouteArgs = ModalRoute
        .of(context)
        .settings
        .arguments as String;
    final selected_meal =
    Provider.of<Products>(context, listen: false).findId(RouteArgs);
    var order_h = Provider.of<OrderHelp>(context);
    if (!f) {
      order_h = initialize(order_h, selected_meal);
      f = true;
    }

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
                        order_h.remove_ingredients =
                            selected_meal.ingredients.where((x) {
                              return !(selected_ingredients.contains(x));
                            }).toList();
                      });
                    },
                  ),
                if (selected_meal.has_choice != null)
                  HasChoice(),
                //------------------------------------------------------------------Order Quantity
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OrderQuantity((val) {
                    setState(() {
                      order_h.qtty = val;
                      order_h.set_cost();
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
                      order_h.side_d = val;
                      order_h.set_cost();
                    });
                  }),
                ),
                //------------------------------------------------------------------Beverage
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Beverage((val) {
                    setState(() {
                      order_h.bev = val;
                      order_h.set_cost();
                    });
                  }),
                ),
                //------------------------------------------------------------------Dessert
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Dessert((val) {
                    setState(() {
                      order_h.dessert = val;
                      order_h.set_cost();
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
                  child: Text("Hacer Pedido (\$${order_h.final_cost})",
                      textAlign: TextAlign.center),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return ConfirmOrder(selected_meal.id); //k
                      },
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
