import 'package:flutter/material.dart';

class RecipeItem {
  String title;
  double cooklength;

  List<RecipeItem> list;

  RecipeItem({this.title, this.cooklength});
}

class MyState extends ChangeNotifier {
  List<RecipeItem> _list = [
    RecipeItem(title: 'Lasagne', cooklength: 45.0),
    RecipeItem(title: 'Tomtegröt', cooklength: 30.0),
    RecipeItem(title: 'Chili Con carne', cooklength: 60),
    RecipeItem(title: 'Pasta Alfredo', cooklength: 45),
    RecipeItem(title: 'Ugnspannkaka', cooklength: 50),
    RecipeItem(title: 'Franssyska i ugn', cooklength: 120),
    RecipeItem(title: 'Ärtsoppa', cooklength: 30),
    RecipeItem(title: 'Pytt i panna', cooklength: 30),
    RecipeItem(title: 'Chorizogryta', cooklength: 45),
    RecipeItem(title: 'Igelkottsgryta', cooklength: 60),
    RecipeItem(title: 'Rokot krompli', cooklength: 90),
    RecipeItem(title: 'Tikka massala', cooklength: 40),
    RecipeItem(title: 'Pasta Bolognese', cooklength: 25),
    RecipeItem(title: 'Ärtsoppa', cooklength: 30),
    RecipeItem(title: 'Pytt i panna', cooklength: 30),
    RecipeItem(title: 'Chorizogryta', cooklength: 45),
    RecipeItem(title: 'Igelkottsgryta', cooklength: 60),
    RecipeItem(title: 'Rokot krompli', cooklength: 90),
    RecipeItem(title: 'Tikka massala', cooklength: 40),
    RecipeItem(title: 'Pasta Bolognese', cooklength: 25),
  ];

  List<RecipeItem> get list => _list;

  getRecipeList() {
    List<RecipeItem> list = getRecipeList();
    _list = list;
    notifyListeners();
  }
}
