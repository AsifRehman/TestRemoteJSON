import 'package:flutter/material.dart';
import 'package:testremotejson/model/party_model.dart';

class PartyDetail extends StatefulWidget {
  static const String id = "partydetail";

  @override
  _PartyDetailState createState() => _PartyDetailState();
}

class _PartyDetailState extends State<PartyDetail> {
  @override
  Widget build(BuildContext context) {
    final Party party = ModalRoute.of(context).settings.arguments as Party;

    return Container(
      child: Text(
        party.partyName,
      ),
    );
  }
}
