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
    try {
      var response = await http
          .get('$APIURL/recipes/search?query=$query', headers: {
        'X-RapidAPI-Key': "60e8154215mshb154a16e630ef85p138ab7jsna8e33460c705"
      });
      var json = jsonDecode(response.body);
      print(response.body);
      return json['results'].map<RecipeItem>((data) {
        return RecipeItem.fromJson(data);
      }).toList();
    } catch (e) {
      throw Exception('Failed to search recipes. Error: ' + e);
    }
  }

  static Future<List<RecipeItem>> getIngredientsSearch(
      String ingredients) async {
    try {
      var response = await http.get(
          '$APIURL/recipes/findByIngredients?ingredients=$ingredients',
          headers: {
            'X-RapidAPI-Key':
                "60e8154215mshb154a16e630ef85p138ab7jsna8e33460c705"
          });
      var json = jsonDecode(response.body);
      print(response.body);
      return json.map<RecipeItem>((data) {
        return RecipeItem.fromJson(data);
      }).toList();
    } catch (e) {
      throw Exception('Failed to search ingredients. Error: ' + e);
    }
  }

  static Future<List<Ingredients>> getRecipeIngredients(int id) async {
    try {
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
    } catch (e) {
      throw throw Exception('Failed to load ingredients. Error: ' + e);
    }
  }

  static Future<List<Instructions>> getRecipeInstructions(int id) async {
    try {
      var response = await http
          .get('$APIURL/recipes/$id/analyzedInstructions', headers: {
        'X-RapidAPI-Key': '60e8154215mshb154a16e630ef85p138ab7jsna8e33460c705'
      });
      var json = jsonDecode(response.body);
      print(json);
      return json[0]['steps'].map<Instructions>((data) {
        return Instructions.fromJson(data);
      }).toList();
    } catch (e) {
      throw e;
    }
  }

  static Future getRecipeId(RecipeItem item) async {
    try {
      var ingredient = await getRecipeIngredients(item.id);
      var instruction = await getRecipeInstructions(item.id);
      return RecipeItemInfo(
          ingredient: ingredient, instruction: instruction, item: item);
    } catch (e) {
      throw Exception('Failed to load recipes. Error: ' + e);
    }
  }

//TODO: måste man returnera något här?
  static Future<JokeItem> getJokesList() async {
    var response;
    try {
      final response = await http.get('$APIURL/food/jokes/random', headers: {
        'X-RapidAPI-Key': '60e8154215mshb154a16e630ef85p138ab7jsna8e33460c705'
      });
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return JokeItem.fromJson(json);
      }
    } catch (e) {
      throw Exception('Failed to load joke. Error: ' + e);
    }
    return response;
  }

//TODO: måste man returnera något här?
  static Future<TriviaItem> getTriviaList() async {
    var response;
    try {
      final response = await http.get('$APIURL/food/trivia/random', headers: {
        'X-RapidAPI-Key': '60e8154215mshb154a16e630ef85p138ab7jsna8e33460c705'
      });
      if (response.statusCode == 200) {
        return TriviaItem.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw Exception('Failed to load trivia. Error: ' + e);
    }
    return response;
  }
}
