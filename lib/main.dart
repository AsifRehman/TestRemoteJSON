import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testremotejson/model/party_model.dart';

Future<List<Party>> fetchParty() async {
  final String url =
      'https://brtapi.azurewebsites.net/odata/tbl_Party?\$select=PartyNameID,PartyName,PartyTypeID';

  final response = await http.get(url);

  if (response.statusCode == 200) {
    Iterable list = json.decode(response.body)["value"];
    return list.map((party) => Party.fromJson(party)).toList();
  } else {
    throw Exception('Failed to load parties');
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
            shrinkWrap: true,
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
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Parties List'),
        ),
        body: Container(
          child: albumWidget(),
        ),
      ),
    );
  }
}
