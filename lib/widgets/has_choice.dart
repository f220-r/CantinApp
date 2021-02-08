import 'package:cantina_app/models/meal.dart';
import 'package:cantina_app/widgets/sub_has_choice.dart';
import 'package:flutter/material.dart';

class HasChoice extends StatefulWidget {
  final int opts;
  final List<Meal> choices;

  HasChoice(this.opts, this.choices);

  @override
  _HasChoiceState createState() => _HasChoiceState();
}

class _HasChoiceState extends State<HasChoice> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    Widget Enabled_Disabled() {
      if (amount > widget.opts)
        return Text("Confirmar");
      else
        return FlatButton(
            onPressed: () {},
            child: Text(
              "Confirmar",
              style: TextStyle(color: Colors.amber),
            ));
    }

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Text("Elegir Opciones"),
          FlatButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    return AlertDialog(
                      content: Column(
                        children: <Widget>[
                              Text("Elija hasta " + "${widget.opts}"),
                            ] +
                            widget.choices.map((x) {
                              return SubHasChoice(x.name, (val) {
                                setState(() {
                                  amount = amount + val;
                                });
                              });
                            }).toList(),
                      ),
                      actions: <Widget>[Enabled_Disabled()],
                    );
                  },
                );
              },
              child: Text("Elegir")),
        ],
      ),
    );
  }
}
