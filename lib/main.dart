import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/Fridge.dart';
import 'package:projectapp/RecipeView.dart';
import 'package:provider/provider.dart';
import 'Model.dart';

void main() {
  var state = MyState();
  state.getList();
  runApp(ChangeNotifierProvider(create: (context) => state, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Cardo'),
        home: Homeview());
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
                    Container(
                      width: 14,
                    ),
                    _favoriteButton(context),
                  ],
                ),
                Container(height: 10),
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
      'FOODIES',
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        shadows: [
          Shadow(
              offset: Offset(3, 3),
              color: Colors.black.withOpacity(0.70),
              blurRadius: 10),
          Shadow(
              offset: Offset(-3, -3),
              color: Colors.greenAccent[100].withOpacity(0.85),
              blurRadius: 10)
        ],
      ),
    );
  }

  Widget _introTextThree() {
    return Text(
      'Search through hundreds of different recipes',
      style: TextStyle(fontSize: 18),
    );
  }

  Widget _inspirationButton(context) {
    return Row(children: [
      BouncingWidget(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Fridge()));
          },
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              width: 185,
              height: 185,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(color: Colors.black, width: 2),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.black,
                        blurRadius: 15),
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blueGrey[500], Colors.cyan])),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.shuffle, size: 40, color: Colors.yellow[700]),
                Text(' Inspiration',
                    style: TextStyle(
                      fontSize: 22,
                      shadows: [
                        Shadow(
                            offset: Offset(3, 3),
                            color: Colors.black.withOpacity(0.70),
                            blurRadius: 10),
                        Shadow(
                            offset: Offset(-3, -3),
                            color: Colors.blueGrey.withOpacity(0.85),
                            blurRadius: 10)
                      ],
                    ))
              ])))
    ]);
  }

  Widget _favoriteButton(context) {
    return Row(children: [
      BouncingWidget(
          onPressed: () {},
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              width: 185,
              height: 185,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(color: Colors.black, width: 2),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.black,
                        blurRadius: 15),
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blueGrey[500], Colors.cyan])),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.campaign, size: 40, color: Colors.yellow[700]),
                Text(' Joke/Trivia',
                    style: TextStyle(
                      fontSize: 22,
                      shadows: [
                        Shadow(
                            offset: Offset(3, 3),
                            color: Colors.black.withOpacity(0.70),
                            blurRadius: 10),
                        Shadow(
                            offset: Offset(-3, -3),
                            color: Colors.blueGrey.withOpacity(0.85),
                            blurRadius: 10)
                      ],
                    ))
              ])))
    ]);
  }

  Widget _recipeViewButton(context) {
    return Column(children: [
      BouncingWidget(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => RecipeView()));
          },
          child: Container(
              width: 385,
              height: 220,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.black,
                        blurRadius: 15),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(color: Colors.black, width: 2),
                  image: DecorationImage(
                      image: AssetImage('assets/FoodPic.png'),
                      fit: BoxFit.cover)),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(children: [
                    Text(' Explore Recipes',
                        style: TextStyle(
                          fontSize: 30,
                          shadows: [
                            Shadow(
                                offset: Offset(3, 3),
                                color: Colors.black.withOpacity(0.70),
                                blurRadius: 10),
                            Shadow(
                                offset: Offset(-3, -3),
                                color: Colors.blueGrey.withOpacity(0.85),
                                blurRadius: 10)
                          ],
                        ))
                  ]))))
    ]);
  }
}
