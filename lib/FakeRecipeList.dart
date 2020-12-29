import 'package:flutter/material.dart';
import 'package:projectapp/FocusRecipeView.dart';
import 'package:projectapp/Model.dart';

class FakeRecipeList extends StatelessWidget {
  final List<RecipeItem> list;
  FakeRecipeList(this.list);

  Widget build(BuildContext context) {
    return ListView(
      children: list.map((item) => _recipeItem(context, item)).toList(),
    );
  }
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

Widget _recipeItem(context, RecipeItem item) {
  return Card(
      child: ListTile(
          title: Text(item.title),
          trailing: Text(item.readyInMinutes.toString() + ' minutes'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FocusRecipeView(item)));
          }));
}
