import 'package:flutter/material.dart';

class RecipeItem {
  String title;
  String ingredients;
  String cooklength;

  RecipeItem({this.title, this.ingredients, this.cooklength});
}

class MyState extends ChangeNotifier {
  List<RecipeItem> _list = [
    RecipeItem(title: 'Lasagne', ingredients: 'test', cooklength: '2h'),
    RecipeItem(title: 'Tomtegröt', ingredients: 'test', cooklength: '30m'),
    RecipeItem(title: 'Chili Con carne', ingredients: 'test', cooklength: '1h'),
    RecipeItem(title: 'Pasta Alfredo', ingredients: 'test', cooklength: '45m'),
    RecipeItem(title: 'Ugnspannkaka', ingredients: 'test', cooklength: '50m'),
    RecipeItem(
        title: 'Franssyska i ugn', ingredients: 'test', cooklength: '2h'),
    RecipeItem(title: 'Ärtsoppa', ingredients: 'test', cooklength: '30m'),
    RecipeItem(title: 'Pytt i panna', ingredients: 'test', cooklength: '10m'),
    RecipeItem(title: 'Chorizogryta', ingredients: 'test', cooklength: '45m'),
    RecipeItem(title: 'Igelkottsgryta', ingredients: 'test', cooklength: '1h'),
    RecipeItem(title: 'Rokot krompli', ingredients: 'test', cooklength: '1,5h'),
    RecipeItem(title: 'Tikka massala', ingredients: 'test', cooklength: '50m'),
    RecipeItem(
        title: 'Pasta Bolognese', ingredients: 'test', cooklength: '30m'),
  ];

  List<RecipeItem> get list => _list;
}
