import 'package:flutter/material.dart';
import 'package:projectapp/FocusRecipeView.dart';
import 'package:projectapp/Model.dart';

class FakeRecipeList extends StatefulWidget {
  final List<RecipeItem> list;
  FakeRecipeList(this.list);

  @override
  _FakeRecipeListState createState() => _FakeRecipeListState();
}

class _FakeRecipeListState extends State<FakeRecipeList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children:
            widget.list.map((item) => _recipeItem(context, item)).toList());
  }

  /*Widget _recipeItem(context, item) {
    *return SingleChildScrollView(
        child: ListTile(
      title: Text(item.title),
      trailing: Text(''),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FocusRecipeView(item)));
      },
    ));
  }
}
*/

  Widget _recipeItem(context, item) {
    return ListTile(
        title: Text(item.title),
        trailing: Text(''),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FocusRecipeView(item)));
        });
  }
}
