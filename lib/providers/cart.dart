import 'package:flutter/widgets.dart';

class CartItem {
  static int num = 0x0;
  final String id = num.toRadixString(8);
  final String title;
  final String order_description;
  final double price;
  final DateTime date = DateTime.now();
  int qtty;

  CartItem({
    @required this.title,
    @required this.price,
    @required this.qtty,
    @required this.order_description,
  }) {
    num++;
  }
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  String addItem(
    String title,
    String id,
    double price,
    int qtty,
    String order_description,
  ) {
    if (_items.containsKey(id))
      _items[id].qtty += qtty;
    else {
      _items.putIfAbsent(
          id,
          () => CartItem(
              title: title,
              price: price,
              qtty: qtty,
              order_description: order_description));
    }
    notifyListeners();
    return id;
  }

  void removeItem(String id, int q) {
    if (_items.containsKey(id)) if ((_items[id].qtty - q) > 0)
      _items[id].qtty -= q;
    else
      _items.remove(id);
    notifyListeners();
  }

  void clean() {
    _items = {};
    notifyListeners();
  }
}