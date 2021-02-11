import 'package:flutter/widgets.dart';

class CartItem {
  final String id;
  final String title;
  final String order_description;
  final double price;
  int qtty;

  CartItem({
    @required this.title,
    @required this.id,
    @required this.price,
    @required this.qtty,
    @required this.order_description,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(
    String title,
    String id,
    double price,
    int qtty,
    String order_description,
  ) {
    if (_items.containsKey(id))
      _items[id].qtty += 1;
    else {
      _items.putIfAbsent(
          id,
          () => CartItem(
              title: title,
              id: DateTime.now().toString(),
              price: price,
              qtty: qtty,
              order_description: order_description));
    }
  }
}
