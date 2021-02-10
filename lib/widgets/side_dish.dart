import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cantina_app/providers/products.dart';

class SideDish extends StatefulWidget {
  @override
  _SideDishState createState() => _SideDishState();
}

class _SideDishState extends State<SideDish> {
  var _value;

  @override
  Widget build(BuildContext context) {
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
          },
          value: _value,
          hint: Text("Elegir"),
        ),
      ],
    );
  }
}
