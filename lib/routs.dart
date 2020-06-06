import 'package:flutter/material.dart';
import 'package:testremotejson/screen/PartyDetail/party_detail.dart';
import 'package:testremotejson/screen/partyList/party_list.dart';

class Routes {
  // Route name constants

  /// The map used to define our routes, needs to be supplied to [MaterialApp]
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      PartyList.id: (context) => PartyList(),
      PartyDetail.id: (context) => PartyDetail(),
    };
  }
}