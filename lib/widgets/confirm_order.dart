import 'package:cantina_app/providers/cart.dart';
import 'package:cantina_app/providers/order_h.dart';
import 'package:cantina_app/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmOrder extends StatelessWidget {
  String kk;

  ConfirmOrder(this.kk);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: false);
    var order = Provider.of<OrderHelp>(context);
    /*
    if(wallet-final_cost < 0.0)
      return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
      ),
      child: Container(
        height: 200,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white70,
                child: Icon(Icons.account_balance_wallet, size: 60,),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.redAccent,
                child: SizedBox.expand(
                  child: FlatButton(
                      color: Colors.indigo,
                      onPressed: (){Navigator.of(context).pop();},
                      child: Text("Ok")),
                ),
              ),
            ),
            ],
        ),
      ),
    );
    */
    //TODO not enoug credit in wallet
    return (order.sum_qtties() == order.selected_meal.choices_amount)
        ? AlertDialog(
            title: Text("Pedido #${kk}"),
            titleTextStyle: Theme.of(context).textTheme.title,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(order.order_h_toString(),
                    style: Theme.of(context).textTheme.display3),
                Divider(
                  indent: 5.0,
                  endIndent: 5.0,
                  color: Colors.indigo.withAlpha(60),
                  thickness: 2.0,
          ),
          Text('Costo final: \$${order.final_cost}',
              style: Theme
                  .of(context)
                  .textTheme
                  .display3),
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
              cart.addItem(order.selected_meal.name, order.selected_meal.id,
                  order.final_cost, order.qtty, order.order_h_toString());
              Navigator.of(context).pushNamed(OrdersScreen.RouteName);
            },
            child: Text("Confirmar Pedido")),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Rechazar")),
      ],
    ) :
    Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
      ),
      child: Container(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.indigo.withAlpha(175),
                child: SizedBox.expand(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Alerta", style: Theme
                          .of(context)
                          .textTheme
                          .display1,),
                      Text(
                        "Debes elegir OPCIONES antes de continuar con tu pedido",
                        textAlign: TextAlign.center, style: Theme
                          .of(context)
                          .textTheme
                          .display4,),
                    ],
                  ),
                ),
              ),
            ),
            FlatButton(
                color: Colors.white70,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Ok")),
          ],
        ),
      ),
    );
  }
}
