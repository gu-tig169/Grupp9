import 'package:flutter/material.dart';
import 'package:projectapp/FakeRecipeList.dart';

class RecipeView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Recipe List',
          style: TextStyle(color: Colors.white, fontSize: 24),
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
    );
  }
}
