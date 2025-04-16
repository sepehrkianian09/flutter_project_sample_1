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

class UserService {
  final storage = Hive.box("storage");
  final usersSerializer = ListSerializer<User>(UserParser());

  List<User> users = [];

  UserService() {
    if (storage.containsKey('users')) {
      users = usersSerializer.parse(storage.get('users'));
    }
  }

  addUser(User user) {
    if (users.any((aUser) => aUser.name == user.name)) {
      throw "Repeated Username";
    }

    users.add(user);
    storage.put('users', usersSerializer.stringify(users));
  }
}
