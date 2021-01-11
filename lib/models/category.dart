import 'package:flutter/cupertino.dart';

class Category{
  final String id;
  final String title;
  final String image_path;
  const Category({
    @required this.id,
    @required this.title,
    this.image_path = null,
  });
}