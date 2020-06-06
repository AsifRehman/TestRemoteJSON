import 'package:flutter/material.dart';

class PartyDetail extends StatefulWidget {
  static const String id = "partydetail";

  @override
  _PartyDetailState createState() => _PartyDetailState();
}

class _PartyDetailState extends State<PartyDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Party Detail",
      ),
    );
  }
}
