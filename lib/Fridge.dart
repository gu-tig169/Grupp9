import 'package:flutter/material.dart';

class Fridge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[300],
          leading: Container(
              alignment: Alignment.center,
              child: Text(
                'Back',
                style: TextStyle(fontSize: 16),
              )),
          title: Text("What's in the fridge?", style: TextStyle(fontSize: 20)),
          centerTitle: true,
          actions: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 15),
              child: Text('Edit',
                  style:
                      TextStyle(fontSize: 16)), //lägg senare in funktionalitet
            ),
          ]),
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
