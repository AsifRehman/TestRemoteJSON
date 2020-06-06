import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  static const String url = 'https://brtapi.azurewebsites.net/odata/';

  String _firmName = "";
  int _count = 0;

  String get firmName {
    return _firmName;
  }

  int get count {
    return _count;
  }

  void updateName(String firmName) {
    _firmName = firmName;
  }

  void incrementCount() {
    _count += 1;
    notifyListeners();
  }
}
