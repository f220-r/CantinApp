import 'package:cantina_app/data/categories_data.dart';
import 'package:cantina_app/widgets/category_item.dart';
import 'package:cantina_app/widgets/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*
Category screen: permits navigation to filtered food items members of the category
content: category tiles which direct to new screen
*/

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 15),
        child: AppBar(
          elevation: 0.0,
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
              '\tMenú del día',
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.start,
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
          Expanded(
            child: GridView(
              //Grid content
              children: CATEGORIES.map((x) {
                return CategoryItem(x.title, x.image_path, x.id);
              }).toList(),
              //Grid structure
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width / 1.5,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
