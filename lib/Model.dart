import 'package:flutter/material.dart';
import 'FetchAPI.dart';

class RecipeItem {
  int id;
  String title;
  String image;
 
  

  RecipeItem({this.id, this.title, this.image,});

  static Map<String, dynamic> toJson(RecipeItem item) {
    return {
      'id': item.id,
      'title': item.title,
      'image': item.image,
      
    };
  }

  static RecipeItem fromJson(Map<String, dynamic> json) {
    return RecipeItem(
      id: json['id'],
      title: json['title'],
      image: json['image'],
     
    );
  }
}

class MyState extends ChangeNotifier {
  List<RecipeItem> _list = [];

  List<RecipeItem> get list => _list;

  Future getList() async {
    List<RecipeItem> list = await FetchAPI.getRecipeList();
    _list = list;
    notifyListeners();
  }
}
