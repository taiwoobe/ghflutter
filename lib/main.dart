import 'package:flutter/material.dart';
import 'strings.dart';

void main() => runApp(MyGHProfileApp());

class MyGHProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(Strings.appTitle),
          centerTitle: true,
          backgroundColor: Colors.indigo.shade700,
        ),
        body: Center(
          child: Text(Strings.appTitle),
        ),
      ),
    );
  }
}
