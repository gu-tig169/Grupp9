import 'package:flutter/material.dart';
import 'package:projectapp/FocusRecipeView.dart';

class FakeRecipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
            leading: Icon(
              Icons.star,
              color: Colors.orange,
            ),
            trailing: Text('35-45 min'),
            title: Text('Lasagne'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FocusRecipeView()),
              );
            }),
        ListTile(
            leading: Icon(
              Icons.star,
              color: Colors.orange,
            ),
            trailing: Text('30 min'),
            title: Text('Pizza'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FocusRecipeView()),
              );
            }),
        ListTile(
            leading: Icon(
              Icons.star,
              color: Colors.orange,
            ),
            trailing: Text('7h'),
            title: Text('Koncz special'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FocusRecipeView()),
              );
            }),
      ],
    );
  }
}
