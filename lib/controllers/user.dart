import 'package:get/get.dart';
import 'package:project_1/models/user.dart';
import 'package:project_1/services/account.dart';
import 'package:project_1/services/login.dart';

class UserController {
  final _accountService = Get.find<AccountService>();
  final _loginService = Get.find<LoginService>();

  String hashString(String aStr) {
    // TODO
    return aStr;
  }

  void register(String username, String password) {
    _accountService.addUser(User(name: username, passwordHash: hashString(password)));
    login(username, password);
  }

  void login(String username, String password) {
    _accountService.authenticate(username, hashString(password));
    _loginService.setActiveUser(username);
  }

  bool isLoggedIn() {
    return _loginService.gotActiveUser();
  }

  logout() {
    return _loginService.removeActiveUser();
  }
}
