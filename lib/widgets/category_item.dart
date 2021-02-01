import 'package:cantina_app/screens/categories_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final String image_path;

  CategoryItem(this.title, this.image_path, this.id);

  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.RouteName,
        arguments: {'title': title, 'id': id});
  }

  @override
  Widget build(BuildContext context) {
    if (image_path == null)
      return InkWell(
        onTap: () => SelectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey.withOpacity(0.2), Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
          child: Center(
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ))),
        ),
      );
    else
      return InkWell(
        onTap: () => SelectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: new BoxDecoration(
            color: Colors.white,
            image: new DecorationImage(
              alignment: Alignment.topCenter,
              image: new AssetImage(image_path),
              fit: BoxFit.none,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
  }
}
