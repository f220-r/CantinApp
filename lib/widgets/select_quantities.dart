import 'package:flutter/material.dart';

class SelectQuantities extends StatefulWidget {
  final Function(int) onSelectionChanged;

  SelectQuantities({this.onSelectionChanged});

  @override
  _SelectQuantitiesState createState() => _SelectQuantitiesState();
}

class _SelectQuantitiesState extends State<SelectQuantities> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Unidades:\t\t\t\t",
          style: Theme.of(context).textTheme.title,
        ),
        //Expanded(child: SizedBox(),),
        IconButton(
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.amber,
              size: 32.0,
            ),
            onPressed: () {
              setState(() {
                amount += 1;
                widget.onSelectionChanged(amount);
              });
            }),
        Text(
          "\t\t${amount}\t\t",
          style: Theme.of(context).textTheme.title,
        ),
        IconButton(
            icon: Icon(Icons.remove_circle_outline,
                color: Colors.amber, size: 32.0),
            onPressed: () {
              setState(() {
                if (amount > 0) amount -= 1;
                widget.onSelectionChanged(amount);
              });
            }),
        //SizedBox(width: 30.0,)
      ],
    );
  }
}
