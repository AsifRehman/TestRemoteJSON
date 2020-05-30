import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Party>> fetchParty() async {
  final String url =
      'https://brtapi.azurewebsites.net/odata/tbl_Party?\$select=PartyNameID,PartyName,PartyTypeID';

  print(url);

  final response = await http.get(url);

  if (response.statusCode == 200) {
    Iterable list = json.decode(response.body)["value"];
    return list.map((party) => Party.fromJson(party)).toList();
  } else {
    throw Exception('Failed to load parties');
  }
}

class Party {
  final int partyID;
  final String partyName;
  final int partyTypeID;

  Party({this.partyID, this.partyName, this.partyTypeID});

  factory Party.fromJson(Map<String, dynamic> json) {
    return Party(
      partyID: json['PartyNameID'],
      partyName: json['PartyName'],
      partyTypeID: json['PartyTypeID'],
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
  Future<List<Party>> futureParty;

  @override
  void initState() {
    super.initState();
    futureParty = fetchParty();
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
              Party snap = snapShot.data[index];
              return Column(
                children: <Widget>[
                  // Widget to display the list of project
                  ListTile(
                    title: Text(snap.partyName),
                  )
                ],
              );
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
      future: futureParty,
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
          title: Text('Parties List'),
        ),
        body: Center(
          child: albumWidget(),
        ),
      ),
    );
  }
}
