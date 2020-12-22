import 'package:flutter/material.dart';
import 'package:projectapp/FakeRecipeList.dart';
import 'package:projectapp/model.dart';
import 'package:provider/provider.dart';

class RecipeView extends StatefulWidget {
  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  Widget build(BuildContext context) {
    TextEditingController _searchController = new TextEditingController();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.greenAccent[100],
          centerTitle: true,
          title: Text(
            'Recipe List',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            Row(
              children: [
                DropdownButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  iconSize: 30,
                  items: [
                    DropdownMenuItem(
                        child: Text('Filter Recipes'), value: 'Filter Recipes'),
                  ],
                  onChanged: (value) {},
                ),
              ],
            ),
          ],
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
          Text(
            'Recipes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Divider(thickness: 2, color: Colors.grey[700])),
          Expanded(child: _viewRecipeList())
        ])));
  }

  Widget _viewRecipeList() {
    return Consumer<MyState>(
        builder: (context, state, child) => FakeRecipeList(state.list));
  }
}
