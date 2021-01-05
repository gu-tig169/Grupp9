import 'package:flutter/material.dart';
import 'package:projectapp/FetchAPI.dart';
import 'package:projectapp/models/JokeModel.dart';
import 'package:projectapp/models/TriviaModel.dart';

class JokesView extends StatefulWidget {
  @override
  _JokesViewState createState() => _JokesViewState();
}

class _JokesViewState extends State<JokesView> {
  Future<JokeItem> futureJokeItem;
  Future<TriviaItem> futureTriviaItem;

  @override
  void initState() {
    super.initState();
    futureJokeItem = FetchAPI.getJokesList();
    futureTriviaItem = FetchAPI.getTriviaList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.greenAccent[100],
          title: Text("Jokes/Trivias",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          centerTitle: true,
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'A funny joke',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FutureBuilder<JokeItem>(
                future: futureJokeItem,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.text,
                        style: TextStyle(
                          fontSize: 25,
                        ));
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                }),
          ),
          SizedBox(
            height: 150,
          ),
          Text(
            'An interesting fact',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FutureBuilder<TriviaItem>(
                future: futureTriviaItem,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.text,
                        style: TextStyle(fontSize: 25));
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                }),
          )
        ])));
  }
}
