import 'package:hive_ce_flutter/hive_flutter.dart';

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
  final storage = Hive.box("storage");
  final usersSerializer = ListSerializer<User>(UserParser());

  List<User> users = [];

  AccountService() {
    if (storage.containsKey('users')) {
      users = usersSerializer.parse(storage.get('users'));
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
    storage.put('users', usersSerializer.stringify(users));
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
