import 'package:cantina_app/models/meal.dart';
/*
ategory(id: '0', title: 'Combos', image_path: "assets/images/categories/combos.png"),
  Category(id: '1', title: 'Hamburguesas' , image_path: 'assets/images/categories/burger.png'),
  Category(id: '3', title: 'Ensaladas',image_path: 'assets/images/categories/salad.png'),
  Category(id: '4', title: 'Sandwiches',image_path: 'assets/images/categories/sandwich.png'),
  Category(id: '5', title: 'Tartas',image_path: 'assets/images/categories/pie.png'),
  Category(id: '6', title: 'Platos Calientes',image_path: 'assets/images/categories/hot meal.png'),
  Category(id: '7', title: 'Pizzas y\n Empanadas',image_path: 'assets/images/categories/pizza.png'),
  Category(id: '8', title: 'Bebidas',image_path: 'assets/images/categories/water.png'),
  Category(id: '9', title:'Postres' ,image_path: 'assets/images/categories/desserts.png'),
  Category(id: '10', title:'Ver Todo' ,image_path: null),
* */
List<Meal> MEALS = [
  Meal(name: 'Hamburguesa', id: '0', amount: 12.0, category_id: '0', image_path: null),
  Meal(name: 'Hamburguesa', id: '1', amount: 12.0, category_id: '0', image_path: 'https://gastronomiaycia.republica.com/wp-content/uploads/2020/02/whopper_sin-aditivos.jpg'),
  Meal(name: 'Ensalada Chica', id: '2', amount: 12.0, category_id: '3', is_vegan: true, is_vegetarian: true, has_choice: true, image_path: 'https://gastronomiaycia.republica.com/wp-content/uploads/2020/02/whopper_sin-aditivos.jpg'),
  Meal(name: 'Something', id: '3', amount: 12.0, category_id: '0', is_gluten_free: true, is_lactose_free: true, is_vegan: true, is_vegetarian: true, image_path: 'https://gastronomiaycia.republica.com/wp-content/uploads/2020/02/whopper_sin-aditivos.jpg'),
  Meal(name: 'Hamburguesa', id: '4', amount: 12.0, category_id: '7', image_path: 'https://www.laespanolaaceites.com/wp-content/uploads/2019/06/pizza-con-chorizo-jamon-y-queso-1080x671.jpg'),
  Meal(name: 'Tarta de Jamon y Queso', id: '5', amount: 12.0, category_id: '5', image_path: 'https://alicante.com.ar/uploads/recetas/87_receta.jpg'),
];