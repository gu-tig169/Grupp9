import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:projectapp/models/ingredient_model.dart';
import 'package:projectapp/models/instruction_model.dart';
import 'package:projectapp/models/joke_model.dart';
import 'package:projectapp/models/recipe_item_info.dart';
import 'package:projectapp/models/recipe_item_model.dart';
import 'package:projectapp/models/trivia_model.dart';

const APIURL = 'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com';

class FetchAPI {
  static Future<List<RecipeItem>> getRecipeSearch(String query) async {
    var response = await http.get('$APIURL/recipes/search?query=$query',
        headers: {
          'X-RapidAPI-Key': "60e8154215mshb154a16e630ef85p138ab7jsna8e33460c705"
        });
    var json = jsonDecode(response.body);
    print(response.body);
    return json['results'].map<RecipeItem>((data) {
      return RecipeItem.fromJson(data);
    }).toList();
  }

  static Future<List<RecipeItem>> getIngredientsSearch(
      String ingredients) async {
    var response = await http.get(
        '$APIURL/recipes/findByIngredients?ingredients=$ingredients',
        headers: {
          'X-RapidAPI-Key': "60e8154215mshb154a16e630ef85p138ab7jsna8e33460c705"
        });
    var json = jsonDecode(response.body);
    print(response.body);
    return json.map<RecipeItem>((data) {
      return RecipeItem.fromJson(data);
    }).toList();
  }

  static Future<List<Ingredients>> getRecipeIngredients(int id) async {
    var response = await http
        .get('$APIURL/recipes/$id/information', headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'X-RapidAPI-Key': "60e8154215mshb154a16e630ef85p138ab7jsna8e33460c705"
    });
    var json = jsonDecode(response.body);
    print(response.body);
    return json['extendedIngredients'].map<Ingredients>((data) {
      return Ingredients.fromJson(data);
    }).toList();
  }

  static Future<List<Instructions>> getRecipeInstructions(int id) async {
    var response = await http.get('$APIURL/recipes/$id/analyzedInstructions',
        headers: {
          'X-RapidAPI-Key': '60e8154215mshb154a16e630ef85p138ab7jsna8e33460c705'
        });
    var json = jsonDecode(response.body);
    print(json);
    return json[0]['steps'].map<Instructions>((data) {
      return Instructions.fromJson(data);
    }).toList();
  }

  static Future getRecipeId(RecipeItem item) async {
    var ingredient = await getRecipeIngredients(item.id);
    var instruction = await getRecipeInstructions(item.id);
    return RecipeItemInfo(
        ingredient: ingredient, instruction: instruction, item: item);
  }

  static Future<JokeItem> getJokesList() async {
    var response = await http.get('$APIURL/food/jokes/random', headers: {
      'X-RapidAPI-Key': '60e8154215mshb154a16e630ef85p138ab7jsna8e33460c705'
    });
    if (response.statusCode == 200) {
      return JokeItem.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load joke');
    }
  }

  static Future<TriviaItem> getTriviaList() async {
    var response = await http.get('$APIURL/food/trivia/random', headers: {
      'X-RapidAPI-Key': '60e8154215mshb154a16e630ef85p138ab7jsna8e33460c705'
    });
    if (response.statusCode == 200) {
      return TriviaItem.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load trivia');
    }
  }
}