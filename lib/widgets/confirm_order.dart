import 'package:cantina_app/providers/cart.dart';
import 'package:cantina_app/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmOrder extends StatelessWidget {
  String kk;

  ConfirmOrder(this.kk);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    var order = Provider.of<Cart>(context).items[kk];
    return AlertDialog(
      title: Text("Pedido #${order.id}"),
      titleTextStyle: Theme.of(context).textTheme.title,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(order.order_description,
              style: Theme.of(context).textTheme.display3),
          Divider(
            indent: 5.0,
            endIndent: 5.0,
            color: Colors.indigo.withAlpha(60),
            thickness: 2.0,
          ),
          Text('Costo final: \$${order.price}',
              style: Theme.of(context).textTheme.display3),
          Expanded(
              child: SizedBox(
            height: double.infinity,
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    "Una vez confirmado el pedido se retirará el costo de su billetera virtual")),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed(OrdersScreen.RouteName);
            },
            child: Text("Confirmar Pedido")),
        FlatButton(
            onPressed: () {
              print(order.qtty);
              cart.removeItem(kk, order.qtty);
              print(order.qtty);
              Navigator.of(context).pop();
            },
            child: Text("Rechazar")),
      ],
    );
  }
}
