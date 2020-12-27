import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Model.dart';

const APIURL = 'https://api.spoonacular.com/recipes/complexSearch';
const APIKEY = 'eb25dad6924649f2a4584b42cba83155';

class FetchAPI {
  static Future<List<RecipeItem>> getRecipeList() async {
    var respone = await http.get('$APIURL?apiKey=$APIKEY&number=10');
    var json = jsonDecode(respone.body);
    return json.map<RecipeItem>((data) {
      return RecipeItem.fromJson(data);
    }).toList();
  }
}
