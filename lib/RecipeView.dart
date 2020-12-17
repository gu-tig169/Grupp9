import 'package:flutter/material.dart';
import 'FakeRecipeList.dart';
import 'Model.dart';
import 'SearchView.dart';
import 'package:provider/provider.dart';

class RecipeView extends StatefulWidget {
  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  Widget build(BuildContext context) {
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
                        child: Text('All'), value: 'All',
                    ),
                    //DropdownMenuItem(child: Text('Alphabetical'), value: 'Alphabetical',),
                
                  ],
                  onChanged: (value) {
                    Provider.of<MyState>(context, listen: false).sortFilterBy(value);
                  },
                ),
              ],
            ),
          ],
        ),
        body: _viewRecipeList(),
        floatingActionButton: _search(context));
  }

  Widget _viewRecipeList() {
    return Consumer<MyState>(
        builder: (context, state, child) => FakeRecipeList(_sortList(state.list, state.sortBy)));
  }

  List<RecipeItem> _sortList(list, sortBy) {
    return list;
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
