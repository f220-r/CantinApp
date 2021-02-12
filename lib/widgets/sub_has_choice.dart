import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cantina_app/providers/order_h.dart';

class SubHasChoice extends StatefulWidget {
  final int indx;
  final Function set_change;

  SubHasChoice(this.indx, this.set_change);

  @override
  _SubHasChoiceState createState() => _SubHasChoiceState();
}

class _SubHasChoiceState extends State<SubHasChoice> {
  @override
  Widget build(BuildContext context) {
    var order_h = Provider.of<OrderHelp>(context);
    return Row(
      children: <Widget>[
        Text(order_h.selected_meal.name),
        IconButton(
          icon: Icon(
            Icons.add,
          ),
          onPressed: () {
            setState(() {
              order_h.qties[widget.indx] += 1;
            });
            widget.set_change();
          },
        ),
        Text(
          "\t${order_h.qties[widget.indx]}\t",
        ),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            if (order_h.qties[widget.indx] > 0) {
              setState(() {
                order_h.qties[widget.indx] -= 1;
              });
              widget.set_change();
            }
          },
        ),
      ],
    );
  }
}
