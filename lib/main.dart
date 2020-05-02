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
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(
                color: Colors.grey.shade500,
              ),
          itemCount: _users.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildRow(index);
          }),
    );
  }

  Widget _buildRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          '${_users[i]['login']}',
          style: const TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }

  _loadData() async {
    String dataURL = Strings.apiEndPoint;
    http.Response response = await http.get(dataURL);
    setState(() {
      _users = json.decode(response.body);
    });
  }
}
