import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoadingState();
  }
}

class LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Loading...",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.greenAccent[100],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                backgroundColor: Colors.greenAccent[100],
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.black12),
                strokeWidth: 10,
              ),
              SizedBox(
                height: 15,
              ),
              LinearProgressIndicator(
                backgroundColor: Colors.greenAccent[100],
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.black12),
                minHeight: 20,
              ),
            ],
          ),
        ));
  }
}
