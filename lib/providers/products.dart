import 'package:flutter/cupertino.dart';
import 'package:cantina_app/models/meal.dart';

class Products with ChangeNotifier {
  List<Meal> _items = [
    Meal(
        name: 'Hamburguesa',
        id: '0',
        amount: 12.0,
        category_id: '0',
        image_path: null),
    Meal(
        name: 'Hamburguesa',
        id: '1',
        amount: 12.0,
        category_id: '0',
        image_path:
            'https://gastronomiaycia.republica.com/wp-content/uploads/2020/02/whopper_sin-aditivos.jpg'),
    Meal(
        name: 'Ensalada Chica',
        id: '2',
        amount: 12.0,
        category_id: '3',
        is_vegan: true,
        is_vegetarian: true,
        has_choice: true,
        image_path:
            'https://gastronomiaycia.republica.com/wp-content/uploads/2020/02/whopper_sin-aditivos.jpg'),
    Meal(
        name: 'Something',
        id: '3',
        amount: 12.0,
        category_id: '0',
        is_gluten_free: true,
        is_lactose_free: true,
        is_vegan: true,
        is_vegetarian: true,
        image_path:
            'https://gastronomiaycia.republica.com/wp-content/uploads/2020/02/whopper_sin-aditivos.jpg',
        description: "Alimento desconocido que tiene esta descripcion y por eso sigo escribiendo mucha para ver como quedara, un misterio sinceramente.",
        ingredients: [
          "tomato",
          "potato",
          "onion",
          "mushroom",
          "pumpkin",
          "lettuce",
          "cheese",
          "TACC"
        ]),
    Meal(
        name: 'Hamburguesa',
        id: '4',
        amount: 12.0,
        category_id: '7',
        image_path:
            'https://www.laespanolaaceites.com/wp-content/uploads/2019/06/pizza-con-chorizo-jamon-y-queso-1080x671.jpg'),
    Meal(
        name: 'Tarta de Jamon y Queso',
        id: '5',
        amount: 12.0,
        category_id: '5',
        image_path: 'https://alicante.com.ar/uploads/recetas/87_receta.jpg'),
  ];
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  void setFilter(String x, bool val) {
    _filters[x] = val;
  }

  List<Meal> get items {
    List<Meal> _availableMeals = _items.where((meal) {
      if (_filters['gluten'] && !meal.is_gluten_free) return false;
      if (_filters['lactose'] && !meal.is_lactose_free) return false;
      if (_filters['vegetarian'] && !meal.is_vegetarian) return false;
      if (_filters['vegan'] && !meal.is_vegan) return false;
      return true;
    }).toList();
    return _availableMeals;
  }

  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }

  Map<String, bool> get filters {
    return _filters;
  }
}
