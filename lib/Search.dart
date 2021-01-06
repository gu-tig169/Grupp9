import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projectapp/FetchAPI.dart';
import 'package:projectapp/FocusRecipeView.dart';
import 'loading/Loading.dart';
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
              child: _recipeCard(),
            )
          ])));
    }
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
                      height: 100,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.greenAccent[100],
                                border: Border.all(width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 100,
                            width: 375,
                            alignment: Alignment.center,
                            child: Text(
                              items[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black.withOpacity(1)),
                            ),
                          )),
                    ),
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
