import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'users.dart';
import 'strings.dart';

class GHFlutter extends StatefulWidget {
  @override
  createState() => GHFlutterState();
}

class GHFlutterState extends State<GHFlutter> {
  var _users = <User>[];
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
          '${_users[i].login}',
          style: const TextStyle(fontSize: 18.0),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.indigo.shade500,
          backgroundImage: NetworkImage(_users[i].avatar),
        ),
      ),
    );
  }

  _loadData() async {
    String dataURL = Strings.apiEndPoint;
    http.Response response = await http.get(dataURL);
    setState(() {
      final usersJSON = json.decode(response.body);
      for (var userObject in usersJSON) {
        final user = User(userObject['login'], userObject['avatar_url']);
        _users.add(user);
      }
    });
  }
}
