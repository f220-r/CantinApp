import 'package:cantina_app/providers/cart.dart';
import 'package:cantina_app/widgets/confirm_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderMinItem extends StatelessWidget {
  String kk;

  OrderMinItem(this.kk);

  @override
  Widget build(BuildContext context) {
    var x = Provider.of<Cart>(context).items[kk];
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      elevation: 0.0,
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                title: Text("Pedido #${x.id}"),
                titleTextStyle: Theme.of(context).textTheme.title,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(x.order_description,
                        style: Theme.of(context).textTheme.display3),
                    Divider(
                      indent: 5.0,
                      endIndent: 5.0,
                      color: Colors.indigo.withAlpha(60),
                      thickness: 2.0,
                    ),
                    Text('Costo final: \$${x.price}',
                        style: Theme.of(context).textTheme.display3),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Fecha: ${x.date.day}/${x.date.month}/${x.date.year}',
                        style: Theme.of(context).textTheme.subtitle),
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Ok")),
                ],
              );
            },
          );
        },
        leading: Text(
          x.id,
          style: TextStyle(fontSize: 20.0),
        ),
        title: Text(
          x.title,
          style: TextStyle(fontSize: 20.0),
        ),
        subtitle: Text(x.qtty.toString() + "x " + x.title,
            style: TextStyle(fontSize: 16.0)),
        trailing: Text(
          '\$${x.price}',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
