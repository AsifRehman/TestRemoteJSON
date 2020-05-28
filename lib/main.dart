import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Album>> fetchAlbum() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums');

  if (response.statusCode == 200) {
    Iterable list = json.decode(response.body);
    return list.map((album) => Album.fromJson(album)).toList();
    //return list.map((e) => Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  Widget albumWidget() {
    return FutureBuilder(
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.done) {
          if (snapShot.hasError) {
            return Center(
              child: Text("SomeThing went wrong."),
            );
          }
          return ListView.builder(
            itemCount: snapShot.data.length,
            itemBuilder: (context, index) {
              Album project = snapShot.data[index];
              return Column(
                children: <Widget>[
                  // Widget to display the list of project
                  ListTile(
                    title: Text(project.title),
                  )
                ],
              );
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
      future: futureAlbum,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example 1'),
        ),
        body: Center(
          child: albumWidget(),
        ),
      ),
    );
  }
}
