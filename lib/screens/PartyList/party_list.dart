import 'package:flutter/material.dart';
import 'package:testremotejson/model/party_model.dart';
import 'package:testremotejson/screens/PartyDetail/party_detail.dart';

class PartyList extends StatefulWidget {
  static const String id = "partylist";

  PartyList({Key key}) : super(key: key);

  @override
  _PartyListState createState() => _PartyListState();
}

class _PartyListState extends State<PartyList> {
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
                    onTap: () {
                      Navigator.pushNamed(context, PartyDetail.id,
                          arguments: snap);
                    },
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Party List"),
      ),
      body: Container(child: albumWidget()),
      floatingActionButton: FloatingActionButton(
        child: Text("Asif"),
        onPressed: () {
          Navigator.pushNamed(context, PartyDetail.id);
        },
      ),
    );
  }
}
