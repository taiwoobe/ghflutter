import 'package:flutter/material.dart';
import 'strings.dart';
import 'ghflutterBrain.dart';

void main() => runApp(MyGHProfileApp());

class MyGHProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(primaryColor: Colors.indigo.shade800),
      home: GHFlutter(),
    );
  }
}
