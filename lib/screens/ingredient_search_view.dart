import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:projectapp/models/recipe_item_model.dart';
import 'package:projectapp/service/fetch_api.dart';
import 'package:projectapp/screens/focus_ingredient_view.dart';
import 'package:projectapp/widgets/loading_widget.dart';

class IngredientSearch extends StatefulWidget {
  final List<RecipeItem> list;
  IngredientSearch({this.list});
  @override
  _IngredientSearchState createState() => _IngredientSearchState();
}

TextEditingController _searchController = new TextEditingController();

class _IngredientSearchState extends State<IngredientSearch> {
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
            _inspirationText(),
            _textField(),
            Expanded(
              child: _recipeCard(),
            )
          ])));
    }
  }

  Widget _inspirationText() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Text(
        'Get inspiration on recipes based on ingredients followed by commas',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _textField() {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: TextField(
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
            )));
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
                    builder: (context) => FocusIngredients(items[index]),
                  ));
            },
          );
        });
  }
}
