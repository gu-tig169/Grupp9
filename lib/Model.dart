import 'package:flutter/material.dart';

class RecipeItem {
  String title;
  String ingredients;
  double cooklength;

  List<RecipeItem> list;

  RecipeItem({this.title, this.ingredients, this.cooklength});
}

class MyState extends ChangeNotifier {
  List<RecipeItem> _list = [
    RecipeItem(title: 'Lasagne', ingredients: 'test', cooklength: 40),
    RecipeItem(title: 'Tomtegröt', ingredients: 'test', cooklength: 30),
    RecipeItem(title: 'Chili Con carne', ingredients: 'test', cooklength: 60),
    RecipeItem(title: 'Pasta Alfredo', ingredients: 'test', cooklength: 45),
    RecipeItem(title: 'Ugnspannkaka', ingredients: 'test', cooklength: 50),
    RecipeItem(title: 'Franssyska i ugn', ingredients: 'test', cooklength: 120),
    RecipeItem(title: 'Ärtsoppa', ingredients: 'test', cooklength: 30),
    RecipeItem(title: 'Pytt i panna', ingredients: 'test', cooklength: 10),
    RecipeItem(title: 'Chorizogryta', ingredients: 'test', cooklength: 45),
    RecipeItem(title: 'Igelkottsgryta', ingredients: 'test', cooklength: 45),
    RecipeItem(title: 'Rokot krompli', ingredients: 'test', cooklength: 50),
    RecipeItem(title: 'Tikka massala', ingredients: 'test', cooklength: 60),
    RecipeItem(title: 'Pasta Bolognese', ingredients: 'test', cooklength: 30),
  ];

  List<RecipeItem> get list => _list;
}
