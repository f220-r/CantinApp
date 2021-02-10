import 'package:flutter/material.dart';

class OrderQuantity extends StatefulWidget {
  final Function set_qtties;

  OrderQuantity(this.set_qtties);

  @override
  _OrderQuantityState createState() => _OrderQuantityState();
}

class _OrderQuantityState extends State<OrderQuantity> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Unidades:",
          style: Theme.of(context).textTheme.title,
        ),
        Expanded(
          child: SizedBox(),
        ),
        IconButton(
          icon: Icon(
            Icons.add_circle_outline,
            color: Colors.amber,
            size: 32.0,
          ),
          onPressed: () {
            setState(() {
              amount += 1;
            });
            widget.set_qtties(amount);
          },
        ),
        Text(
          "\t\t${amount}\t\t",
          style: Theme.of(context).textTheme.title,
        ),
        IconButton(
          icon: Icon(Icons.remove_circle_outline,
              color: Colors.amber, size: 32.0),
          onPressed: () {
            if (amount > 0)
              setState(() {
                amount -= 1;
              });
            widget.set_qtties(amount);
          },
        ),
      ],
    );
  }
}
