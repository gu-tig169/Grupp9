import 'package:projectapp/models/IngredientModel.dart';
import 'package:projectapp/models/RecipeItemModel.dart';
import 'package:projectapp/models/InstructionModel.dart';

class RecipeItemInfo {
  RecipeItem item;
  List<Ingredients> ingredient;
  List<Instructions> instruction;

  RecipeItemInfo({this.item, this.ingredient, this.instruction});
}
