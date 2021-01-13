import 'package:cantina_app/data/categories_data.dart';
import 'package:cantina_app/widgets/category_item.dart';
import 'package:cantina_app/widgets/main_drawer.dart';
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\tMenú del día',
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.start,
            ),
          ),
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
