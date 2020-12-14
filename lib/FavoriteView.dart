import 'package:flutter/material.dart';
import 'package:projectapp/FakeRecipeList.dart';

class FavoriteView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text(
          'Favorite List',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("sort"),
              )
            ],
          ),
        ],
      ),
      body: FakeRecipeList(),
    );
  }
}
