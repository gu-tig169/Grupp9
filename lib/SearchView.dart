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
        backgroundColor: Colors.green[300],
        centerTitle: true,
        title: Text(
          "Search for a recipe",
          style: TextStyle(
              color: Colors.white, fontStyle: FontStyle.italic, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _pancakePhoto(),
            _textField(),
            _saveSearch(context),
          ],
        ),
      ),
    );
  }

  Widget _textField() {
    return Container(
      padding: EdgeInsets.all(24),
      child: TextField(
        //controller: textEditingController,
        decoration: InputDecoration(
          hintText: 'Search',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _saveSearch(BuildContext context) {
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

  Widget _pancakePhoto() {
    return Stack(
      children: [
        Image(
            alignment: Alignment.topCenter,
            height: 415,
            image: NetworkImage(
                'https://blog.williams-sonoma.com/wp-content/uploads/2020/02/stack-pancakes-blog-post-1000px.jpg'))
      ],
    );
  }
}
