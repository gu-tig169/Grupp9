import 'package:flutter/material.dart';

class Fridge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  'Get inspiration on recipes based on ingredients followed by commas',
                  style: TextStyle(fontSize: 16),
                )),
            Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                child: TextFormField(
                  //controller: textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '(tomato, garlic, pasta, parsley...)',
                  ),
                ))
          ],
        )),

        //FakeRecipeList(),
      ),
    );
  }
}
