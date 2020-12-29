import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Model.dart';

const APIURL =
    'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/';

class FetchAPI {
  static Future<List<RecipeItem>> getRecipeList() async {
    var response = await http.get(
        '$APIURL' + 'search',
        headers: {
          'X-RapidAPI-Key': "60e8154215mshb154a16e630ef85p138ab7jsna8e33460c705"
        });
    var json = jsonDecode(response.body);
    return json['results'].map<RecipeItem>((data) {
      return RecipeItem.fromJson(data);
    }).toList();
  }
}
