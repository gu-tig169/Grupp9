import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:projectapp/models/recipe_item_model.dart';
import 'package:projectapp/service/fetch_api.dart';
import 'package:projectapp/views/recipe_view.dart';

class FocusRecipeView extends StatefulWidget {
  final RecipeItem item;
  FocusRecipeView({this.item});

  @override
  _FocusRecipeViewState createState() => _FocusRecipeViewState();
}

class _FocusRecipeViewState extends State<FocusRecipeView> {
  var itemInfo;

  void _getRecipeInformation(RecipeItem item) async {
    var information = await FetchAPI.getRecipeId(item);
    setState(() {
      itemInfo = information;
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
          title: Text(itemInfo.item.title,
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
              child: _ingredientList(),
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
        image: NetworkImage(
            'https://spoonacular.com/recipeImages/' + itemInfo.item.image),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _ingredientList() {
    var ingredient = itemInfo.ingredient;
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
    var instruction = itemInfo.instruction;
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