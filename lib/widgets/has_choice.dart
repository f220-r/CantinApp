import 'package:cantina_app/models/meal.dart';
import 'package:cantina_app/widgets/sub_has_choice.dart';
import 'package:flutter/material.dart';

class HasChoice extends StatelessWidget {
  final int opts;
  final List<Meal> choices;
  final Function ret_choice;

  HasChoice(this.opts, this.choices, this.ret_choice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Text(
            "Opciones:",
            style: Theme.of(context).textTheme.title,
          ),
          Expanded(child: SizedBox()),
          FlatButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    return RefreshableAlert(opts, choices, ret_choice);
                  },
                );
              },
              child: Text(
                "Elegir",
                style: TextStyle(
                    color: Colors.indigo.withAlpha(150), fontSize: 24.0),
              )),
        ],
      ),
    );
  }
}

class RefreshableAlert extends StatefulWidget {
  final int opts;
  final List<Meal> choices;
  final Function ret_choice;

  RefreshableAlert(this.opts, this.choices, this.ret_choice);

  @override
  _RefreshableAlertState createState() => _RefreshableAlertState();
}

class _RefreshableAlertState extends State<RefreshableAlert> {
  int amount = 0;
  List<int> qties = [];

  @override
  void initState() {
    for (int i = 0; i < widget.choices.length; i++) qties.add(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget Enabled_Disabled() {
      return FlatButton(
          onPressed: (amount > widget.opts)
              ? null
              : () {
                  String res = "";
                  for (int i = 0; i < qties.length; i++)
                    res += qties[i].toString() +
                        "x " +
                        widget.choices[i].name +
                        '\n';
                  widget.ret_choice(res);
                  Navigator.of(context).pop();
                },
          child: Text(
            "Confirmar",
            style: TextStyle(
                color: (amount > widget.opts) ? Colors.grey : Colors.amber),
          ));
    }

    return AlertDialog(
      content: Column(
        children: <Widget>[
              Text(
                "Elija hasta " + "${widget.opts}" + " opciones",
                style: TextStyle(
                    color: (amount > widget.opts)
                        ? Colors.redAccent
                        : Colors.amber),
              ),
            ] +
            widget.choices.map((x) {
              return SubHasChoice(x.name, (val, vva) {
                setState(() {
                  amount = amount + val;
                  qties[widget.choices.indexOf(x)] = vva;
                  print(qties);
                });
              });
            }).toList(),
      ),
      actions: <Widget>[Enabled_Disabled()],
    );
  }
}
