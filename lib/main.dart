import 'package:flutter/material.dart';
import 'strings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyGHProfileApp());

class MyGHProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      home: GHFlutter(),
    );
  }
}

class GHFlutter extends StatefulWidget {
  @override
  createState() => GHFlutterState();
}

class GHFlutterState extends State<GHFlutter> {
  var _users = [];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade700,
      ),
      body: Text(Strings.appTitle),
    );
  }

  _loadData() async {
    String dataURL = 'https://api.github.com/orgs/github/public_members';
    http.Response response = await http.get(dataURL);
    setState(() {
      _users = json.decode(response.body);
    });
  }
}
