import 'package:flutter/material.dart';

class Joke {
  String text;

  Joke({this.text});

  static Joke fromJson(Map<String, dynamic> json) {
    return Joke(text: json['text']);
  }

  static Map<String, dynamic> toJson(Joke joke) {
    return {
      'text': joke.text,
    };
  }
}

class FakeRecipeList extends StatelessWidget {
  final List<Joke> list;
  FakeRecipeList(this.list);

  Widget build(BuildContext context) {
    return ListView(
      children: list.map((joke) => _jokeText(context, joke)).toList(),
    );
  }

  Widget _jokeText(context, Joke joke) {
    return Text(joke.text);
  }
}
