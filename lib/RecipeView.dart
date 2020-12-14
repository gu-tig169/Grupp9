import 'package:flutter/material.dart';
import 'package:projectapp/FakeRecipeList.dart';
import 'package:projectapp/SearchView.dart';

class RecipeView extends StatefulWidget {
  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text(
          'Recipe List',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
        ),
        actions: [
          Row(
            children: [
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              DropdownButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                iconSize: 30,
                items: [
                  DropdownMenuItem(
                      child: Text('Favorites'), value: 'Favorites'),
                  DropdownMenuItem(
                      child: Text('Filter Recipes'), value: 'Filter Recipes'),
                ],
                onChanged: (value) {},
              ),
            ],
          ),
        ],
      ),
      body: FakeRecipeList(),
      floatingActionButton: _search(context),
    );
  }

  Widget _search(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: (Colors.green[300]),
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchView(),
              ));
        });
  }
}
