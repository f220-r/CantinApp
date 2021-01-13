import 'package:cantina_app/data/categories_data.dart';
import 'package:cantina_app/widgets/category_item.dart';
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
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 10.0,
          ),
          Text('Potatoes'),
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
