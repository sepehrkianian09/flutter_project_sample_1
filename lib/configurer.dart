import 'package:get/get.dart';

import 'package:project_1/controllers/user.dart';
import 'package:project_1/services/account.dart';
import 'package:project_1/services/login.dart';
import 'package:project_1/dataStorage/hive.dart';
import 'package:project_1/dataStorage/interface.dart';

class Configurer {
  Future<void> specify() async {
    final hiveDataStorageInstance = await HiveDataStorage.getInstance();
    Get.lazyPut<DataStorage>(() => hiveDataStorageInstance);

    Get.lazyPut<UserController>(() => UserController());

    Get.lazyPut<AccountService>(() => AccountService());
    Get.lazyPut<LoginService>(() => LoginService());
  }
}
