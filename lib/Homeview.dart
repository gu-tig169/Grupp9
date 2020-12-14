import 'package:flutter/material.dart';
import 'package:projectapp/Fridge.dart';
import 'package:projectapp/RecipeView.dart';
import 'package:projectapp/FavoriteView.dart';

class Homeview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent[100],
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _introTextOne(),
                Container(height: 10),
                _introTextTwo(),
                Container(height: 40),
                _introTextThree(),
                Container(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _inspirationButton(context),
                    _favoriteButton(context),
                  ],
                ),
                _recipeViewButton(context),
              ]),
        ));
  }

  Widget _introTextOne() {
    return Text(
      'Welcome to',
      style: TextStyle(fontSize: 18),
    );
  }

  Widget _introTextTwo() {
    return Text(
      'Foodies',
      style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic),
    );
  }

  Widget _introTextThree() {
    return Text(
      'Search through hundreds of different recipes',
      style: TextStyle(fontSize: 18),
    );
  }

  Widget _favoriteButton(context) {
    return Row(children: [
      Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          width: 200,
          height: 200,
          child: RaisedButton.icon(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  )),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoriteView()));
              },
              icon: Icon(Icons.star, color: Colors.yellow[700]),
              label: Text('Favorites'),
              color: Colors.blueGrey))
    ]);
  }

  Widget _inspirationButton(context) {
    return Row(children: [
      Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          width: 200,
          height: 200,
          child: RaisedButton.icon(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Fridge()));
              },
              icon: Icon(Icons.shuffle, color: Colors.yellow[700]),
              label: Text('Inspo'),
              color: Colors.blueGrey))
    ]);
  }

  Widget _recipeViewButton(context) {
    return Column(children: [
      Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          width: 400,
          height: 220,
          child: RaisedButton(
              child: Text(
                'Explore recipes',
                style: TextStyle(fontSize: 20),
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RecipeView()));
              },
              color: Colors.blueGrey))
    ]);
  }
}
