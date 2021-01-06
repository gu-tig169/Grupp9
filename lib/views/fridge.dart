import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:projectapp/models/recipe_item_model.dart';
import 'package:projectapp/service/fetch_api.dart';
import 'package:projectapp/views/focus_ingredient.dart';
import 'package:projectapp/widgets/loading_widget.dart';

class Fridge extends StatefulWidget {
  final List<RecipeItem> list;
  Fridge({this.list});
  @override
  _FridgeState createState() => _FridgeState();
}

TextEditingController _searchController = new TextEditingController();

class _FridgeState extends State<Fridge> {
  var items;

  Future _getIngredients(String ingredients) async {
    try {
      var item = await FetchAPI.getIngredientsSearch(ingredients);
      setState(() {
        items = item;
      });
    } catch (e) {}
  }

  initState() {
    super.initState();
    _getIngredients('');
  }

  @override
  Widget build(BuildContext context) {
    if (items == null) {
      return Loading();
    } else {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Navigator.of(context).pop()),
            title: Text("What's in the fridge?",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            centerTitle: true,
            backgroundColor: Colors.greenAccent[100],
          ),
          body: Center(
              child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Text(
                'Get inspiration on recipes based on ingredients followed by commas',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: _textField(),
            ),
            Expanded(
              child: _recipeCard(),
            )
          ])));
    }
  }

  Widget _textField() {
    return TextField(
        onChanged: (String text) {
          _getIngredients(_searchController.text);
        },
        controller: _searchController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                _searchController.text = '';
              }),
          hintText: 'Example: garlic, pasta, parsley, chicken...',
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
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage((items[index].image)),
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
                                  fontSize: 20,
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
                    builder: (context) => FocusIngredients(items[index]),
                  ));
            },
          );
        });
  }
}
