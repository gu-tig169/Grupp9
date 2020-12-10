import 'package:flutter/material.dart';

class FakeRecipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.star,
            color: Colors.grey,
          ),
          title: Text('Lasagne'),
          trailing: Text('35-45 min'),
        ),
        ListTile(
          leading: Icon(
            Icons.star,
            color: Colors.grey,
          ),
          title: Text('Pizza'),
          trailing: Text('30 min'),
        ),
        ListTile(
          leading: Icon(
            Icons.star,
            color: Colors.grey,
          ),
          title: Text('Koncz special'),
          trailing: Text('7h'),
        ),
      ],
    );
  }
}
