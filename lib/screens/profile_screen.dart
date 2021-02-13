import 'package:cantina_app/providers/products.dart';
import 'package:cantina_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const RouteName = '/my-profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _gluten_free = false;
  bool _lactose_free = false;
  bool _vegan = false;
  bool _vegetarian = false;

  bool init = false;

  @override
  void initialize(Products product) {
    _gluten_free = product.filters['gluten'];
    _lactose_free = product.filters['lactose'];
    _vegan = product.filters['vegan'];
    _vegetarian = product.filters['vegetarian'];
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
    Products product = Provider.of<Products>(context);
    if (!init) {
      init = true;
      initialize(product);
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                      product.setFilter("vegan", _vegan);
                      product.setFilter("vegetarian", _vegetarian);
                      product.setFilter("gluten", _gluten_free);
                      product.setFilter("lactose", _lactose_free);
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
