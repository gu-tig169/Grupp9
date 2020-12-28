import 'package:flutter/material.dart';
import 'Sort.dart';

class Fridge extends StatefulWidget {
  @override
  _FridgeState createState() => _FridgeState();
}

class _FridgeState extends State<Fridge> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = new TextEditingController();
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.greenAccent[100],
            title: Text("What's in the fridge?",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            centerTitle: true,
            actions: []),
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
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'tomato, garlic, pasta, parsley...',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Text(
            'Recipes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Divider(thickness: 2, color: Colors.grey[700])),
          Expanded(child: Sort())
        ])));
  }
}
