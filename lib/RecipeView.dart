import 'package:flutter/material.dart';
import 'package:projectapp/Sort.dart';
import 'SearchView.dart';

class RecipeView extends StatefulWidget {
  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Find a recipe'),
          backgroundColor: Colors.green[300],
        ),
        body: SafeArea(
          child: Sort(),
        ));
  }

  Widget _search(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: (Colors.greenAccent[100]),
        child: Icon(
          Icons.search,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchView(),
              ));
        });
  }
}
