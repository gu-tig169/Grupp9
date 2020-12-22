import 'package:flutter/material.dart';
import 'package:projectapp/model.dart';

class FocusRecipeView extends StatelessWidget {
  final RecipeItem item;
  FocusRecipeView(this.item);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.greenAccent[100],
        title: Text('Receptet för ' + item.title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          _picture(),
          Text(
            item.title,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontStyle: FontStyle.italic),
          ),
          Text(
            'Tid: ' + '{item.cooklength}',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Ingridienser: ' + item.ingredients,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _picture() {
    return Container(
      height: 400,
      child: Stack(
        children: [
          Image(
              image: NetworkImage(
                  'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&resize=700%2C636'))
        ],
      ),
    );
  }
}
