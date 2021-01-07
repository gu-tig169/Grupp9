import 'package:flutter/material.dart';

import 'package:projectapp/models/joke_model.dart';
import 'package:projectapp/models/trivia_model.dart';
import 'package:projectapp/service/fetch_api.dart';

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
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              _jokeText(),
              _jokeWidget(),
              SizedBox(
                height: 50,
              ),
              _triviaText(),
              _triviaWidget()
            ]))));
  }

  Widget _jokeWidget() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
            return CircularProgressIndicator(
              backgroundColor: Colors.greenAccent[100],
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.black12),
              strokeWidth: 10,
            );
          }),
    );
  }

  Widget _triviaWidget() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FutureBuilder<TriviaItem>(
          future: futureTriviaItem,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.text, style: TextStyle(fontSize: 25));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator(
              backgroundColor: Colors.greenAccent[100],
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.black12),
              strokeWidth: 10,
            );
          }),
    );
  }

  Widget _jokeText() {
    return Text(
      'A funny joke',
      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
    );
  }

  Widget _triviaText() {
    return Text(
      'An interesting fact',
      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
    );
  }
}
