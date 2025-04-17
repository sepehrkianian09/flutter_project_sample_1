import 'package:get/get.dart';
import 'package:project_1/dataStorage/interface.dart';

import '../models/user.dart';
import 'parser.dart';

class UserParser extends ObjectParser<User> {
  @override
  User fromJson(Map<String, dynamic> aTJSon) {
    return User(name: aTJSon['name'], passwordHash: aTJSon['passwordHash']);
  }

  @override
  Map<String, dynamic> toJson(User aT) {
    return {'name': aT.name, 'passwordHash': aT.passwordHash};
  }
}

class AccountService {
  final _storage = Get.find<DataStorage>();
  final _usersSerializer = ListSerializer<User>(UserParser());

  List<User> users = [];

  AccountService() {
    if (_storage.containsKey('users')) {
      users = _usersSerializer.parse(_storage.get('users'));
    }
  }

  bool _containsUser(String username) {
    return users.any((aUser) => aUser.name == username);
  }

  addUser(User user) {
    if (_containsUser(user.name)) {
      throw "Repeated Username";
    }

    users.add(user);
    _storage.add('users', _usersSerializer.stringify(users));
  }

  authenticate(String username, String passwordHash) {
    if (!_containsUser(username)) {
      throw "User Not Found";
    }

    User user = users.firstWhere((user) => user.name == username);
    if (user.passwordHash != passwordHash) {
      throw "Wrong Password";
    }
  }
}
