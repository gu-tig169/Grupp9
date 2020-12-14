import 'package:flutter/material.dart';
import 'package:projectapp/FakeRecipeList.dart';

class FavoriteView extends StatelessWidget {
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
            'Favorite List',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontStyle: FontStyle.italic),
          ),
          actions: [
            DropdownButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                iconSize: 30,
                items: [
                  DropdownMenuItem(child: Text('Sort A-Z'), value: 'Sort A-Z'),
                ],
                onChanged: (value) {}),
          ]),
      body: FakeRecipeList(),
    );
  }
}
