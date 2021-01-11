import 'dart:ui';
import 'package:projectapp/screens/search_views/widgets/card.dart';
import 'package:projectapp/screens/search_views/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/models/recipe_item_model.dart';
import 'package:projectapp/service/fetch_api.dart';
import 'package:projectapp/widgets/appBar_widget.dart';
import 'package:projectapp/widgets/loading_widget.dart';

class IngredientSearch extends StatefulWidget {
  final List<RecipeItem> list;
  IngredientSearch({this.list});
  @override
  _IngredientSearchState createState() => _IngredientSearchState();
}

TextEditingController _searchController = new TextEditingController();

class _IngredientSearchState extends State<IngredientSearch> {
  var items;
  Future _getIngredients(String ingredients) async {
    try {
      var item = await FetchAPI.getIngredientsSearch(ingredients);
      setState(() {
        items = item;
      });
    } catch (e) {}
  }

  initState() {
    super.initState();
    _getIngredients('');
  }

  @override
  Widget build(BuildContext context) {
    if (items == null) {
      return Loading();
    } else {
      return Scaffold(
          appBar: CustomAppBar(title: "What's in the fridge?"),
          body: Center(
              child: Column(children: <Widget>[
            _inspirationText(),
            CustomTextField(_searchController, 'garlic, parsley, cheese...',
                onChanged: () {
              _getIngredients(_searchController.text);
            }),
            Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return CustomCard(items[index].image, items[index].title,
                          onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FocusIngredients(items[index]),
                            ));
                      });
                    }))
          ])));
    }
  }

  Widget _inspirationText() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Text(
        'Get inspiration on recipes based on ingredients followed by commas',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
