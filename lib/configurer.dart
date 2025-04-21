import 'package:get/get.dart';
import 'package:project_1/controllers/category.dart';
import 'package:project_1/controllers/statistics.dart';

import 'package:project_1/controllers/user.dart';
import 'package:project_1/controllers/wallet.dart';
import 'package:project_1/services/account.dart';
import 'package:project_1/services/category.dart';
import 'package:project_1/services/login.dart';
import 'package:project_1/dataStorage/hive.dart';
import 'package:project_1/dataStorage/interface.dart';
import 'package:project_1/services/transaction.dart';

class Configurer {
  Future<void> specify() async {
    final hiveDataStorageInstance = await HiveDataStorage.getInstance();
    Get.lazyPut<DataStorage>(() => hiveDataStorageInstance);

    Get.lazyPut<AccountService>(() => AccountService());
    Get.lazyPut<LoginService>(() => LoginService());
    Get.lazyPut<CategoryService>(() => CategoryService());
    Get.lazyPut<TransactionService>(() => TransactionService());

    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<WalletController>(() => WalletController());
    Get.lazyPut<StatisticsController>(() => StatisticsController());
  }
}
