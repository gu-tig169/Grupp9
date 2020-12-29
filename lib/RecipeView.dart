import 'package:flutter/material.dart';
import 'package:projectapp/FakeRecipeList.dart';
import 'package:provider/provider.dart';

import 'Model.dart';

class RecipeView extends StatefulWidget {
  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = new TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text('Find a recipe'),
          backgroundColor: Colors.green[300],
        ),
        body: Center(
            child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search dish...',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Row(children: [
            Padding(padding: EdgeInsets.only(left: 25)),
            Text(
              'Recipes',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 250,
            ),
            Text(
              'Ready in',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ]),
          Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Divider(thickness: 2, color: Colors.grey[700])),
          Expanded(child: _viewList())
        ])));
  }

  Widget _viewList() {
    return Consumer<MyState>(
        builder: (context, state, child) => FakeRecipeList(state.list));
  }
}
