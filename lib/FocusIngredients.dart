import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projectapp/models/RecipeItemModel.dart';

import 'FetchAPI.dart';
import 'Search.dart';

class FocusIngredients extends StatefulWidget {
  final RecipeItem item;
  FocusIngredients({this.item});

  @override
  _FocusIngredientsState createState() => _FocusIngredientsState();
}

class _FocusIngredientsState extends State<FocusIngredients> {
  var recipeInfo;

  void _getRecipeInformation(RecipeItem item) async {
    var information = await FetchAPI.getRecipeId(item);
    setState(() {
      recipeInfo = information;
    });
  }

  initState() {
    super.initState();
    _getRecipeInformation(widget.item);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context)
                .pop(MaterialPageRoute(builder: (context) => Search())),
          ),
          backgroundColor: Colors.greenAccent[100],
          title: Text(recipeInfo.item.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        body: Center(
          child: Column(children: [
            _picture(context),
            Text(
              'Ingredients',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Expanded(
              child: _ingredientsList(),
            ),
            Text(
              'Instructions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Expanded(
              child: _instructionList(),
            )
          ]),
        ));
  }

  Widget _picture(context) {
    return Container(
      height: 250,
      width: 425,
      padding: EdgeInsets.only(bottom: 10),
      child: Image(
        image: NetworkImage(recipeInfo.item.image),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _ingredientsList() {
    var ingredient = recipeInfo.ingredient;
    return ListView.builder(
        itemCount: ingredient.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(
            ingredient[index].originalString + '.',
            style: TextStyle(fontSize: 18),
          ));
        });
  }

  Widget _instructionList() {
    var instruction = recipeInfo.instruction;
    return ListView.builder(
        itemCount: instruction.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(
            instruction[index].number.toString() +
                '. ' +
                instruction[index].step,
            style: TextStyle(fontSize: 18),
          ));
        });
  }
}
