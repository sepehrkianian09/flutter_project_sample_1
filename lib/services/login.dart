import 'package:get/get.dart';
import 'package:project_1/dataStorage/interface.dart';

class LoginService {
  final _storage = Get.find<DataStorage>();

  setActiveUser(String username) {
    _storage.add("activeUser", username);
  }

  bool gotActiveUser() {
    return _storage.containsKey('activeUser');
  }

  removeActiveUser() {
    _storage.remove('activeUser');
  }
}
