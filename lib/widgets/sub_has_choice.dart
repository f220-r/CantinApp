import 'package:flutter/material.dart';

class SubHasChoice extends StatefulWidget {
  final String name;
  final Function has_changed;

  SubHasChoice(this.name, this.has_changed);

  @override
  _SubHasChoiceState createState() => _SubHasChoiceState();
}

class _SubHasChoiceState extends State<SubHasChoice> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(widget.name),
        IconButton(
          icon: Icon(
            Icons.add,
          ),
          onPressed: () {
            setState(() {
              amount += 1;
            });
            widget.has_changed(1, amount);
          },
        ),
        Text(
          "\t${amount}\t",
        ),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            if (amount > 0) {
              setState(() {
                amount -= 1;
              });
              widget.has_changed(-1, amount);
            }
          },
        ),
      ],
    );
  }
}
