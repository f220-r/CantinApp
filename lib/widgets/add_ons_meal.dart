import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cantina_app/providers/products.dart';

class SideDish extends StatefulWidget {
  final Function get_cost;

  SideDish(this.get_cost);

  @override
  _SideDishState createState() => _SideDishState();
}

class _SideDishState extends State<SideDish> {
  var _value = "-1";

  @override
  Widget build(BuildContext context) {
    var p_items = Provider.of<Products>(context).items;
    return Row(
      children: <Widget>[
        Text(
          "Acompañamiento: ",
          style: Theme.of(context).textTheme.title,
        ),
        Expanded(child: SizedBox()),
        DropdownButton(
          items: Provider.of<Products>(context)
                  .items
                  .where((x) {
                    return x.is_sidedish;
                  })
                  .toList()
                  .map((x) {
                    return DropdownMenuItem(
                        value: x.id,
                        child: Row(
                          children: <Widget>[
                            Text(x.name),
                            Text(
                              "\t+\$${x.amount} ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ));
                  })
                  .toList() +
              [
                DropdownMenuItem(
                  child: Text("Ninguno\t+\$0.0"),
                  value: '-1',
                )
              ],
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            var x =
                p_items.firstWhere((x) => (x.id == value), orElse: () => null);
            widget.get_cost((x == null) ? null : x);
          },
          value: _value,
          hint: Text("Elegir"),
        ),
      ],
    );
  }
}

class Dessert extends StatefulWidget {
  final Function get_cost;

  Dessert(this.get_cost);

  @override
  _DessertState createState() => _DessertState();
}

class _DessertState extends State<Dessert> {
  var _value = "-1";

  @override
  Widget build(BuildContext context) {
    var p_items = Provider.of<Products>(context).items;
    return Row(
      children: <Widget>[
        Text(
          "Postre: ",
          style: Theme.of(context).textTheme.title,
        ),
        Expanded(child: SizedBox()),
        DropdownButton(
          items: Provider.of<Products>(context)
                  .items
                  .where((x) {
                    return x.category_id == '9';
                  })
                  .toList()
                  .map((x) {
                    return DropdownMenuItem(
                        value: x.id,
                        child: Row(
                          children: <Widget>[
                            Text(x.name),
                            Text(
                              "\t+\$${x.amount} ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ));
                  })
                  .toList() +
              [
                DropdownMenuItem(
                  child: Text("Ninguno\t+\$0.0"),
                  value: '-1',
                )
              ],
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            var x =
                p_items.firstWhere((x) => (x.id == value), orElse: () => null);
            widget.get_cost((x == null) ? null : x);
          },
          value: _value,
          hint: Text("Elegir"),
        ),
      ],
    );
  }
}

class Beverage extends StatefulWidget {
  final Function get_cost;

  Beverage(this.get_cost);

  @override
  _BeverageState createState() => _BeverageState();
}

class _BeverageState extends State<Beverage> {
  var _value = "-1";

  @override
  Widget build(BuildContext context) {
    var p_items = Provider.of<Products>(context).items;
    return Row(
      children: <Widget>[
        Text(
          "Bebida: ",
          style: Theme.of(context).textTheme.title,
        ),
        Expanded(child: SizedBox()),
        DropdownButton(
          items: p_items
                  .where((x) {
                    return x.category_id == '8';
                  })
                  .toList()
                  .map((x) {
                    return DropdownMenuItem(
                        value: x.id,
                        child: Row(
                          children: <Widget>[
                            Text(x.name),
                            Text(
                              "\t+\$${x.amount} ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ));
                  })
                  .toList() +
              [
                DropdownMenuItem(
                  child: Text("Ninguna\t+\$0.0"),
                  value: '-1',
                )
              ],
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            var x =
                p_items.firstWhere((x) => (x.id == value), orElse: () => null);
            widget.get_cost((x == null) ? null : x);
          },
          value: _value,
          hint: Text("Elegir"),
        ),
      ],
    );
  }
}
