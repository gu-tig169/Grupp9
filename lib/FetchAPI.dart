import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Joke.dart';
import 'Model.dart';

const APIURL = 'https://api.spoonacular.com/recipes/complexSearch';
const APIKEY = 'eb25dad6924649f2a4584b42cba83155';

class FetchAPI {
  static Future<List<RecipeItem>> getRecipeList() async {
    var response = await http.get('$APIURL?apiKey=$APIKEY&number=10');
    var json = jsonDecode(response.body);
    print(json);
    return json['results'].map<RecipeItem>((data) {
      return RecipeItem.fromJson(data);
    }).toList();
  }

  static Future<List<Joke>> getJokeList() async {
    var response = await http.get(
        'https://api.spoonacular.com/food/jokes/random?apiKey=eb25dad6924649f2a4584b42cba83155');
    var json = jsonDecode(response.body);
    print(json);
    return json['text'].map<Joke>((data) {
      return Joke.fromJson(data);
    }).toList();
  }
}
