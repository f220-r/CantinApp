import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cantina_app/providers/products.dart';

class Dessert extends StatefulWidget {
  @override
  _DessertState createState() => _DessertState();
}

class _DessertState extends State<Dessert> {
  var _value;

  @override
  Widget build(BuildContext context) {
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
          },
          value: _value,
          hint: Text("Elegir"),
        ),
      ],
    );
  }
}
