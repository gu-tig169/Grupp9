import 'package:flutter/material.dart';
import 'FakeRecipeList.dart';
import 'model.dart';
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
                    DropdownMenuItem(
                      child: Text('A-Z'), value: 'A-Z',),
                
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
    if(sortBy == 'All')
    return list;

    if(sortBy == 'A-Z') return 
    list.sort((a, b) {
      return a.title.toString().compareTo(b.title.toString());
  });

    return null;


    //List.sort((a, b) => a.toString().compareTo(b.toString()));
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
