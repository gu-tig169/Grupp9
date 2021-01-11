import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projectapp/screens/search_views/widgets/card.dart';
import 'package:projectapp/screens/search_views/widgets/textfield.dart';
import 'package:projectapp/models/recipe_item_model.dart';
import 'package:projectapp/service/fetch_api.dart';
import 'package:projectapp/screens/focus_views/focus_recipe_view.dart';
import 'package:projectapp/widgets/appBar_widget.dart';
import 'package:projectapp/widgets/loading_widget.dart';

TextEditingController textEditingController = TextEditingController();

class RecipeSearch extends StatefulWidget {
  final List<RecipeItem> list;
  RecipeSearch({this.list});

  @override
  _RecipeSearchState createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearch> {
  var items;
  Future _getRecipes(String query) async {
    try {
      var item = await FetchAPI.getRecipeSearch(query);
      setState(() {
        items = item;
      });
    } catch (e) {}
  }

  initState() {
    super.initState();
    _getRecipes('');
  }

  Widget build(BuildContext context) {
    if (items == null) {
      return Loading();
    } else {
      return Scaffold(
          appBar: CustomAppBar(title: 'Find a Recipe'),
          body: Center(
              child: Column(children: [
            CustomTextField(textEditingController, 'Search dish...',
                onChanged: () {
              _getRecipes(textEditingController.text);
            }),
            _recipesText(),
            _dividerLine(),
            Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return CustomCard(
                          'https://spoonacular.com/recipeImages/' +
                              items[index].image,
                          items[index].title, onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FocusRecipeView(items[index]),
                            ));
                      });
                    }))
          ])));
    }
  }

  Widget _recipesText() {
    return Text(
      'Recipes',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  Widget _dividerLine() {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Divider(thickness: 2, color: Colors.grey[700]));
  }
}
