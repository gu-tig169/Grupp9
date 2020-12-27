import 'package:flutter/material.dart';
import 'FetchAPI.dart';

class RecipeItem {
  String title;
  int id;
  String image;
  String imageType;

  RecipeItem({this.title, this.id, this.image, this.imageType});

  static Map<String, dynamic> toJson(RecipeItem item) {
    return {
      'title': item.title,
      'id': item.id,
      'image': item.image,
      'imageType': item.imageType
    };
  }

  static RecipeItem fromJson(Map<String, dynamic> jsonData) {
    return RecipeItem(
        title: jsonData['title'],
        id: jsonData['id'],
        image: jsonData['image'],
        imageType: jsonData['imageType']);
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
