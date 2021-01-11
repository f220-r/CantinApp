import 'package:flutter/cupertino.dart';

class Meal{
  final String name;
  final String id;
  final String category_id;
  final double amount;
  final String image_path;
  final List<String> ingredients;
  final bool is_gluten_free;
  final bool is_lactose_free;
  final bool is_vegetarian;
  final bool is_vegan;

  final bool has_choice;
  Meal({
    @required this.name,
    @required this.id,
    @required this.amount,
    @required this.category_id,
    this.image_path = null,
    this.ingredients = null,
    this.is_gluten_free = false,
    this.is_lactose_free = false,
    this.is_vegan = false,
    this.is_vegetarian = false,

    this.has_choice = false,
  });
}