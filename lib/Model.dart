import 'package:flutter/material.dart';
import 'FetchAPI.dart';

class RecipeItem {
  int id;
  String title;
  String image;
  int readyInMinutes;

  RecipeItem({this.id, this.title, this.image, this.readyInMinutes});

  static Map<String, dynamic> toJson(RecipeItem item) {
    return {
      'id': item.id,
      'title': item.title,
      'image': item.image,
      'readyInMinutes': item.readyInMinutes,
    };
  }

  static RecipeItem fromJson(Map<String, dynamic> json) {
    return RecipeItem(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      readyInMinutes: json['readyInMinutes'],
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
