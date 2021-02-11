import 'package:cantina_app/providers/cart.dart';
import 'package:cantina_app/widgets/main_drawer.dart';
import 'package:cantina_app/widgets/order_item_minimized.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  static const RouteName = '/my-orders';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget NonEmptyCart(BuildContext ctx, Map<String, CartItem> cart) {
    if (cart.length != 0)
      return ListView.builder(
        itemBuilder: (ctx, index) {
          String ky = cart.keys.elementAt(index);
          return OrderMinItem(ky);
        },
        itemCount: cart.length,
        itemExtent: 100.0,
      );
    else
      return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            "",
            style: Theme.of(ctx).textTheme.display4,
          ),
        ),
      );
  }

  Widget build(BuildContext context) {
    var product = Provider.of<Cart>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedidos"),
      ),
      drawer: MainDrawer(),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset('assets/images/blue_square.png'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset('assets/images/yellow_square.png'),
          ),
          NonEmptyCart(context, product),
        ],
      ),
    );
  }
}
