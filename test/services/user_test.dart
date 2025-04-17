import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:project_1/dataStorage/interface.dart';
import 'package:project_1/models/user.dart';
import 'package:project_1/services/parser.dart';
import 'package:project_1/services/account.dart';

import 'fakeDataStorage.dart';

void main() {
  group('Parser', () {
    test('users sample 1', () {
      List<User> users = [
        User(name: 'jj', passwordHash: 'kk'),
        User(name: 'ok', passwordHash: 'ko'),
      ];

      var userListSerializer = ListSerializer<User>(UserParser());

      var usersString = userListSerializer.stringify(users);

      List<User> retrievedUsers = userListSerializer.parse(usersString);

      expect(retrievedUsers.toString(), equals(users.toString()));
    });
  });

  group('Service', () {
    test('users sample 2', () {
      Get.lazyPut<DataStorage>(() => FakeDataStorage());

      var jj = AccountService();

      jj.addUser(User(name: 'k', passwordHash: 'jo'));

      expect(
        () => jj.addUser(User(name: 'k', passwordHash: 'jo')),
        throwsA(equals("Repeated Username")),
      );
    });
  });
}
