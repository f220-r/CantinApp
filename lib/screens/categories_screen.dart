import 'package:cantina_app/data/categories_data.dart';
import 'package:cantina_app/providers/products.dart';
import 'package:cantina_app/widgets/category_item.dart';
import 'package:cantina_app/widgets/main_drawer.dart';
import 'package:cantina_app/widgets/meal_item_minimized.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
/*
Category screen: permits navigation to filtered food items members of the category
content: category tiles which direct to new screen
*/

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menu_del_dia = Provider.of<Products>(context).items.firstWhere((x) {
      return x.name == ("Menu del Día");
    });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 15),
        child: AppBar(
          elevation: 0.0,
        ),
      ),
      drawer: MainDrawer(),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                //--------------------------------------------------------------------Billetera virtual
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.account_balance_wallet,
                        size: 64.0,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Billetera virtual:",
                            style: Theme.of(context).textTheme.title,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(
                                width: 200.0,
                              ),
                              Text(
                                "\$00.00",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w800),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                //--------------------------------------------------------------------Menu del dia
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\tMenú del día:',
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.start,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 3.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            MealMinItem(menu_del_dia),
                            Text(
                              menu_del_dia.description,
                              style: Theme.of(context).textTheme.display4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //--------------------------------------------------------------------Categorias
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\tIr a...',
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.start,
                  ),
                ),
              ]),
            ),
            SliverGrid(
              delegate: SliverChildListDelegate(CATEGORIES.map((x) {
                return CategoryItem(x.title, x.image_path, x.id);
              }).toList()),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

