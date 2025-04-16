import 'package:project_1/models/user.dart';
import 'package:project_1/services/user.dart';

class UserController {
  final service = UserService();

  String hashString(String aStr) {
    // TODO
    return aStr;
  }

  void register(String username, String password) {
    service.addUser(User(name: username, passwordHash: hashString(password)));
  }
}
