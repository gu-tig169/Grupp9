import 'package:flutter/material.dart';

class RecipeView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Recipe List',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        actions: [IconButton(icon: Icon(Icons.delete), onPressed: () {})],
      ),
      body: _recipeList(),
    );
  }

  Widget _recipeList() {
    return null;
  }
}
