import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          "Search recipe",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            textField(),
            saveSearch(context),
          ],
        ),
      ),
    );
  }

  Widget textField() {
    return Container(
      padding: EdgeInsets.all(24),
      child: TextField(
        //controller: textEditingController,
        decoration: InputDecoration(
          hintText: 'Search for recipe',
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }

  Widget saveSearch(BuildContext context) {
    return Column(
      children: [
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.search),
          label: Text(
            'Search',
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
