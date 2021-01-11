import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projectapp/screens/search_views/widgets/card.dart';
import 'package:projectapp/screens/search_views/widgets/textfield.dart';
import 'package:projectapp/models/recipe_item_model.dart';
import 'package:projectapp/service/fetch_api.dart';
import 'package:projectapp/screens/focus_views/focus_recipe_view.dart';
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

//TODO: Samma här då, som ovan alltså.
  initState() {
    super.initState();
    _getRecipes('');
  }

  Widget build(BuildContext context) {
    if (items == null) {
      return Loading();
    } else {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Navigator.of(context).pop()),
            title: Text("Find a recipe",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            centerTitle: true,
            backgroundColor: Colors.greenAccent[100],
          ),
          body: Center(
              child: Column(children: [
            CustomTextField(textEditingController, 'Search dish...',
                onChanged: () {
              _getRecipes(textEditingController.text);
            }),
            _recipesText(),
            _dividerLine(),
            Expanded(
              child: CustomCard(
                items,
                'https://spoonacular.com/recipeImages/',
                onTap: () {
                  print('Fixa detta i card.dart');
                },
              ),
            )
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

  Widget _recipeCard() {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                        height: 450,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  ('https://spoonacular.com/recipeImages/' +
                                      items[index].image)),
                            ))),
                    Positioned(
                        bottom: 0,
                        height: 110,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                            child: Container(
                                height: 100,
                                width: 395,
                                color: Colors.black.withOpacity(0.5),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15),
                                    child: Text(
                                      items[index].title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 21,
                                          color: Colors.white),
                                    ),
                                  ),
                                )),
                          ),
                        ))
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FocusRecipeView(items[index]),
                  ));
            },
          );
        });
  }
}
