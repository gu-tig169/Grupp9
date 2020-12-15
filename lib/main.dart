import 'package:flutter/material.dart';
import 'Homeview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodies',
      theme: ThemeData(fontFamily: 'Cardo'),
      home: Homeview(),
    );
  }
}
