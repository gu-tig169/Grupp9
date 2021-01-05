import 'dart:ui';
import 'package:flutter/material.dart';
import 'FetchAPI.dart';
import 'FocusIngredients.dart';
import 'package:projectapp/models/RecipeItemModel.dart';

class Fridge extends StatefulWidget {
  final List<RecipeItem> list;
  Fridge({this.list});
  @override
  _FridgeState createState() => _FridgeState();
}

TextEditingController _searchController = new TextEditingController();

class _FridgeState extends State<Fridge> {
  var items;
  Future _getIngredients(String ingredients) async {
    var item = await FetchAPI.getIngredientsSearch(ingredients);
    setState(() {
      items = item;
    });
  }

  initState() {
    super.initState();
    _getIngredients("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop()),
          title: Text("What's in the fridge?",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.greenAccent[100],
        ),
        body: Center(
            child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Text(
              'Get inspiration on recipes based on ingredients followed by commas',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: _textField2(),
          ),
          Expanded(
            child: _showScreen2(),
          )
        ])));
  }

  Widget _showScreen2() {
    try {
      if (items == null) {
        return Center(child: CircularProgressIndicator());
      }
    } catch (e) {
      print(e);
      throw e;
    }
    return _recipeCard2();
  }

  Widget _textField2() {
    return TextField(
        onChanged: (String text) {
          _getIngredients(_searchController.text);
        },
        controller: _searchController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                _searchController.text = '';
              }),
          hintText: 'Example: tomato, garlic, pasta, parsley...',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.black, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: Colors.blue, width: 1.5),
          ),
          prefixIcon: Icon(Icons.search),
        ));
  }

  Widget _recipeCard2() {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage((items[index].image)),
                            ))),
                    Positioned(
                        bottom: 0,
                        height: 100,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                    height: 90,
                                    width: 375,
                                    color: Colors.black.withOpacity(0),
                                    child: Center(
                                      child: Text(
                                        items[index].title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                    )),
                              ),
                            )))
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FocusIngredients(item: items[index]),
                  ));
            },
          );
        });
  }
}
