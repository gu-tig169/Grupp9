import 'package:flutter/material.dart';

class FocusRecipeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.greenAccent[100],
        title: Text('*Det valda receptet*',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        actions: [
          Container(
            margin: EdgeInsets.all(15),
            child: Icon(
              Icons.star,
              color: Colors.yellow[700],
              size: 30,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          _picture(),
          Text(
            'En mystisk gryta',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontStyle: FontStyle.italic),
          ),
          Text('Ingridenser, kanske vatten är bra att ha'),
          Text('Instruktioner - Gör så här blablabla'),
          IconButton(icon: Icon(Icons.thumb_up), onPressed: () {}),
          IconButton(icon: Icon(Icons.thumb_down), onPressed: () {}),
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
