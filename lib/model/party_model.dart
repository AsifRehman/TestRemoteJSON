import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testremotejson/scoped_model/main_model.dart';

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

Future<List<Party>> fetchParty() async {
  final String url =
      MainModel.url + 'tbl_Party?\$select=PartyNameID,PartyName,PartyTypeID';

  final response = await http.get(url);

  if (response.statusCode == 200) {
    Iterable list = json.decode(response.body)["value"];
    return list.map((party) => Party.fromJson(party)).toList();
  } else {
    throw Exception('Failed to load parties');
  }
}
