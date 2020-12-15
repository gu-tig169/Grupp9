import 'package:flutter/material.dart';

class RecipeItem {
  String title;
  String cooklength;
  bool star;

  RecipeItem({this.title, this.cooklength, this.star});
}

class MyState extends ChangeNotifier {
  List<RecipeItem> _list = [
    RecipeItem(title: 'Lasagne', cooklength: '2h', star: false),
    RecipeItem(title: 'Tomtegröt', cooklength: '30m', star: false),
    RecipeItem(title: 'Chili Con carne', cooklength: '1h', star: false),
    RecipeItem(title: 'Pasta Alfredo', cooklength: '45m', star: false),
    RecipeItem(title: 'Ugnspannkaka', cooklength: '50m', star: false),
    RecipeItem(title: 'Franssyska i ugn', cooklength: '2h', star: false),
    RecipeItem(title: 'Ärtsoppa', cooklength: '30m', star: false),
    RecipeItem(title: 'Pytt i panna', cooklength: '10m', star: false),
    RecipeItem(title: 'Chorizogryta', cooklength: '45m', star: false),
    RecipeItem(title: 'Igelkottsgryta', cooklength: '1h', star: false),
    RecipeItem(title: 'Rokot krompli', cooklength: '1,5h', star: false),
    RecipeItem(title: 'Tikka massala', cooklength: '50m', star: false),
    RecipeItem(title: 'Pasta Bolognese', cooklength: '30m', star: false),
  ];

  List<RecipeItem> get list => _list;
}

/*class MyState extends StatefulWidget {
  List<Model> _list = FakeRecipeList();
  List<Model> get list => _list;

  void searchRecipe(Model recipe) async {
    var index = _list.indexWhere((list) => list == recipe);
    _list[index].id = id;
  }
}*/
