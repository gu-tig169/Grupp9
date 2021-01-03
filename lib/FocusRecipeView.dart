import 'package:flutter/material.dart';
import 'package:projectapp/Model.dart';

class FocusRecipeView extends StatelessWidget {
  final RecipeItem item;
  FocusRecipeView(this.item);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.greenAccent[100],
        title: Text(item.title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          _picture(context),
          _instructions(),
        ],
      ),
    );
  }

  Widget _picture(context) {
    return Container(
      height: 350,
      width: 425,
      padding: EdgeInsets.only(bottom: 50),
      child: Image(
        image:
            NetworkImage('https://spoonacular.com/recipeImages/' + item.image),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _instructions() {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: 250,
        child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 350,
            ),
            child: Text(
              item.title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontStyle: FontStyle.italic),
            )),
      ),
      Container(
        alignment: Alignment.topCenter,
        height: 100,
        child: Text(
          'Time: ' + item.readyInMinutes.toString() + ' Minutes',
          style: TextStyle(fontSize: 18),
        ),
      ),
      Container(
        alignment: Alignment.bottomCenter,
        height: 100,
        child: Text('Ingredients: FISK FÖRFAN!'),
      ),
    ]);
  }
}
