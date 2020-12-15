import 'package:flutter/material.dart';
import 'package:projectapp/Fridge.dart';
import 'package:projectapp/RecipeView.dart';
import 'package:projectapp/FavoriteView.dart';
import 'package:provider/provider.dart';
import 'model.dart';

void main() {
  var state = MyState();
  runApp(ChangeNotifierProvider(create: (context) => state, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homeview());
  }
}

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
                    Radius.circular(8.0),
                  )),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoriteView()));
              },
              icon: Icon(Icons.star, size: 40, color: Colors.yellow[700]),
              label: Text(
                'Favorites',
                style: TextStyle(fontSize: 22),
              ),
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
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Fridge()));
              },
              icon: Icon(Icons.shuffle, size: 40, color: Colors.yellow[700]),
              label: Text(
                'Inspiration',
                style: TextStyle(fontSize: 22),
              ),
              color: Colors.blueGrey))
    ]);
  }

  Widget _recipeViewButton(context) {
    return Column(children: [
      Container(
        width: 385,
        height: 220,
        child: FlatButton(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Explore recipes',
              style: TextStyle(fontSize: 30),
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => RecipeView()));
          },
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            border: Border.all(color: Colors.black, width: 2),
            image: DecorationImage(
                image: AssetImage('assets/FoodPic.png'), fit: BoxFit.cover)),
      )
    ]);
  }
}
