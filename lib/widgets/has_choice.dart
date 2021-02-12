import 'package:cantina_app/widgets/sub_has_choice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cantina_app/providers/order_h.dart';

class HasChoice extends StatelessWidget {
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
                    return RefreshableAlert();
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

  @override
  _RefreshableAlertState createState() => _RefreshableAlertState();
}

class _RefreshableAlertState extends State<RefreshableAlert> {
  bool f = false;
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    var order_h = Provider.of<OrderHelp>(context);
    if (!f) {
      order_h.set_qtties();
      amount = order_h.sum_qtties();
      f = true;
    }
    Widget Enabled_Disabled() {
      return FlatButton(
          onPressed: (amount != order_h.opts) ? null : () {
            String res = "";
            for (int i = 0; i < order_h.qties.length; i++)
              res += "\t" + order_h.qties[i].toString() +
                  "x " +
                  order_h.choice[i].name +
                  '\n';
            order_h.choices = res;
            Navigator.of(context).pop();
          },
          child: Text(
            "Confirmar",
            style: TextStyle(
                color: (amount != order_h.opts) ? Colors.grey : Colors.amber),
          ));
    }

    return AlertDialog(
      content: Column(
        children: <Widget>[
          Text(
            "Elija hasta " + "${order_h.opts}" + " opciones",
            style: TextStyle(
                color: (amount != order_h.opts)
                    ? Colors.redAccent
                    : Colors.amber),
          ),
        ] +
            order_h.choice.map((x) =>
                SubHasChoice(order_h.choice.indexOf(x), () {
                  setState(() {
                    amount = order_h.sum_qtties();
                  });
                })).toList(),
      ),
      actions: <Widget>[Enabled_Disabled()],
    );
  }
}
