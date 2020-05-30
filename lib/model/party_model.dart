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
