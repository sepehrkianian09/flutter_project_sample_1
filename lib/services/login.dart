import 'package:hive_ce_flutter/hive_flutter.dart';

class LoginService {
  final storage = Hive.box("storage");

  setActiveUser(String username) {
    storage.put("activeUser", username);
  }

  bool gotActiveUser() {
    return storage.containsKey('activeUser');
  }

  removeActiveUser() {
    storage.delete('activeUser');
  }
}
