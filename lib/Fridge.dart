import 'package:flutter/material.dart';

class Fridge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green[300],
            leading:
                Container(alignment: Alignment.center, child: Text('Back')),
            title:
                Text("What's in the fridge?", style: TextStyle(fontSize: 24)),
            centerTitle: true,
            actions: [
              Container(
                margin: EdgeInsets.all(15),
                child: Text('Edit',
                    style: TextStyle(
                        fontSize: 24)), //lägg senare in funktionalitet
              ),
            ]),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset('Bild på kylskåp'),
              Column(
                children: [
                  Text(
                      'Get inspiration on recipes based on ingredients followed by commas'),
                  TextField(
                      //controller: textEditingController,
                      decoration: InputDecoration(
                    hintText: '(tomato, garlic, pasta, parsley...)',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ))
                ],
              )
            ]),

            //FakeRecipeList(),
          ),
        ));
  }
}
