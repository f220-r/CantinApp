import 'package:cantina_app/models/meal.dart';
import 'package:flutter/cupertino.dart';

class OrderHelp with ChangeNotifier {
  Meal selected_meal;

  Meal side_d;

  Meal bev;
  Meal dessert;

  int qtty;
  List<String> remove_ingredients = [];
  String choices;

  double final_cost = 0.0;

  int opts;
  List<Meal> choice;
  List<int> qties = [];

  OrderHelp({
    this.selected_meal = null,
    this.side_d = null,
    this.bev = null,
    this.dessert = null,
    this.qtty = 1,
    this.choices = "!!  Opcion no elegida !!",
    this.opts = 0,
    this.choice = null,
  });

  void set_cost() {
    final_cost = (selected_meal.amount +
            ((bev != null) ? bev.amount : 0.0) +
            ((dessert != null) ? dessert.amount : 0.0) +
            ((side_d != null) ? side_d.amount : 0.0)) *
        qtty;
    notifyListeners();
  }

  void set_qtties() {
    if (choice != null) {
      if (qties.length != choice.length)
        for (int i = 0; i < choice.length; i++) qties.add(0);
    }
  }

  int sum_qtties() {
    int sum = 0;
    if (qties.length != 0)
      for (int i = 0; i < qties.length; i++) sum += qties[i];
    return sum;
  }

  String order_h_toString() {
    String order_s = "";
    order_s += qtty.toString() +
        "x " +
        selected_meal.name +
        " __" +
        " \$" +
        selected_meal.amount.toString() +
        "\n";
    if (selected_meal.has_choice != null) order_s += choices + '\n\n';
    if (side_d != null)
      order_s += qtty.toString() +
          "x " +
          side_d.name +
          " __" +
          " \$" +
          side_d.amount.toString() +
          "\n\n";
    if (dessert != null)
      order_s += qtty.toString() +
          "x " +
          dessert.name +
          " __" +
          " \$" +
          dessert.amount.toString() +
          "\n\n";
    if (bev != null)
      order_s += qtty.toString() +
          "x " +
          bev.name +
          " __" +
          " \$" +
          bev.amount.toString() +
          "\n\n";
    if (remove_ingredients.length != 0)
      order_s += "- Sin: " +
          remove_ingredients
              .reduce((value, element) => value + ', ' + element) +
          '\n';
    return order_s;
  }
}
