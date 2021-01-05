import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projectapp/FetchAPI.dart';
import 'package:projectapp/FocusRecipeView.dart';
import 'models/RecipeItemModel.dart';

//sätta i klassen
TextEditingController textEditingController = TextEditingController();

class Search extends StatefulWidget {
  final List<RecipeItem> list;
  Search({this.list});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var items;

  Future _getRecipes(String query) async {
    var item = await FetchAPI.getRecipeSearch(query);
    setState(() {
      items = item;
    });
  }

  initState() {
    super.initState();
    _getRecipes('');
  }

  Widget build(BuildContext context) {
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
          Padding(
            padding: EdgeInsets.all(10.0),
            child: _textField(),
          ),
          Padding(padding: EdgeInsets.only(left: 25)),
          Text(
            'Recipes',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Divider(thickness: 2, color: Colors.grey[700])),
          Expanded(
            child: _showScreen(),
          )
        ])));
  }

  Widget _showScreen() {
    try {
      if (items == null) {
        return Center(child: CircularProgressIndicator());
      }
    } catch (e) {
      print(e);
      throw e;
    }
    return _recipeCard();
  }

  Widget _textField() {
    return TextField(
        onChanged: (String text) {
          _getRecipes(textEditingController.text);
        },
        controller: textEditingController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                textEditingController.text = '';
              }),
          hintText: 'Search dish...',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.black, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: Colors.blue, width: 1.5),
          ),
          prefixIcon: Icon(Icons.search),
        ));
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
                        height: 130,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                    height: 100,
                                    width: 375,
                                    color: Colors.black.withOpacity(0),
                                    child: Center(
                                      child: Text(
                                        items[index].title + '\nTime to make: ' + items[index].readyInMinutes.toString() + ' minutes' + '\nServings: ' + items[index].servings.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                    )),
                              ),
                            )))
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FocusRecipeView(item: items[index]),
                  ));
            },
          );
        });
  }
}
