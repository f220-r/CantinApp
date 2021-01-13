import 'package:cantina_app/models/meal.dart';
import 'package:cantina_app/screens/meal_item_screen.dart';
import 'package:flutter/material.dart';

class MealMinItem extends StatelessWidget {
  final Meal x;
  MealMinItem(this.x);

  String aptos  = "Apto: ";
  void LoadAptos(){
    bool edible = false;
    if(x.is_lactose_free) {
        aptos += "intolerantes a la lactosa .";
        edible = true;
      }
    if(x.is_gluten_free) {
      aptos += "celiacos .";
      edible = true;
    }
    if(x.is_vegetarian) {
      aptos += "vegetarianos .";
      edible = true;
    }
    if(x.is_vegan) {
      aptos += "veganos .";
      edible = true;
    }
    if(!edible)
      aptos = "";
  }
  Widget ValidImagePath(BuildContext ctx){
    if(x.image_path == null || x.image_path == "")
      return Text("");
    else
      return ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.network(x.image_path, fit: BoxFit.fill),
      );
  }
  void SelectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(MealItemScreen.RouteName, arguments: x.id);
  }
  @override
  Widget build(BuildContext context) {
    LoadAptos();
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      elevation: 0.0,
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        onTap: ()=>SelectMeal(context),
        leading: ValidImagePath(context),
        title: Text(x.name, style: TextStyle(fontSize: 20.0),),
        subtitle: Text(aptos, style: TextStyle(fontSize: 16.0)),
        trailing: Text('\$${x.amount}', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
