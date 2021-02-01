import 'package:cantina_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const RouteName = '/my-profile';
  final Function _saveFilters;
  final Map<String, bool> _currFilters;

  ProfileScreen(this._currFilters, this._saveFilters);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _gluten_free = false;
  bool _lactose_free = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState() {
    _gluten_free = widget._currFilters['gluten'];
    _lactose_free = widget._currFilters['lactose'];
    _vegan = widget._currFilters['vegan'];
    _vegetarian = widget._currFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String description, bool currVal, Function updateVal) {
    return SwitchListTile(
      value: currVal,
      onChanged: updateVal,
      title: Text(title, style: Theme.of(context).textTheme.display4),
      subtitle: Text(description),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi Perfil"),
      ),
      drawer: MainDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //----------------------------------------------------------------User Data
          Text(
            "Nombre: ",
            style: Theme.of(context).textTheme.display3,
          ),
          Text("Apellido: ", style: Theme.of(context).textTheme.display3),
          Text("Curso: ", style: Theme.of(context).textTheme.display3),
          Text("Mail: ", style: Theme.of(context).textTheme.display3),
          Text("Contraseña: ", style: Theme.of(context).textTheme.display3),

          //----------------------------------------------------------------Filters
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "Filtros de búsqueda",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                    "Libre de Gluten",
                    "La página de comidas solo mostrará alimentos aptos para celíacos",
                    _gluten_free, (nV) {
                  setState(() {
                    _gluten_free = nV;
                  });
                }),
                _buildSwitchListTile(
                    "Libre de Lactosa",
                    "La página de comidas solo mostrará alimentos aptos para intolerantes a la lactosa",
                    _lactose_free, (nV) {
                  setState(() {
                    _lactose_free = nV;
                  });
                }),
                _buildSwitchListTile(
                    "Vegetarian@",
                    "La página de comidas solo mostrará alimentos aptos para vegetarian@s",
                    _vegetarian, (nV) {
                  setState(() {
                    _vegetarian = nV;
                  });
                }),
                _buildSwitchListTile(
                    "Vegan@",
                    "La página de comidas solo mostrará alimentos aptos para vegan@s",
                    _vegan, (nV) {
                  setState(() {
                    _vegan = nV;
                  });
                }),
                FlatButton(
                    onPressed: () {
                      final selectedFilters = {
                        'gluten': _gluten_free,
                        'lactose': _lactose_free,
                        'vegetarian': _vegetarian,
                        'vegan': _vegan,
                      };
                      widget._saveFilters(selectedFilters);
                    },
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("Guardar Cambios",
                            style: Theme.of(context).textTheme.button))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
