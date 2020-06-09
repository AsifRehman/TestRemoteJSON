import 'package:flutter/material.dart';
import 'package:testremotejson/routs.dart';
import 'package:testremotejson/screens/partylist/party_list.dart';

void main() => runApp(MaterialApp(
      routes: Routes.getRoutes(),
      home: PartyList(),
    ));
