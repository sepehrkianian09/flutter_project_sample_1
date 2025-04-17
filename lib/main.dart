import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/user.dart';
import 'package:project_1/services/account.dart';
import 'package:project_1/services/login.dart';
import 'package:project_1/storage/hive.dart';
import 'package:project_1/storage/interface.dart';

import 'account.dart';
import 'dashboard.dart';

void specifyConfiguration() {
  Get.lazyPut<DataStorage>(() => HiveDataStorage());

  Get.lazyPut<UserController>(() => UserController());

  Get.lazyPut<AccountService>(() => AccountService());
  Get.lazyPut<LoginService>(() => LoginService());
}

Future<void> main() async {
  specifyConfiguration();

  await Get.find<DataStorage>().init();

  runApp(const FinancialApp());
}

class FinancialApp extends StatelessWidget {
  const FinancialApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/dashboard',
      getPages: [
        GetPage(name: '/dashboard', page: () => DashboardPage()),
        GetPage(name: '/account', page: () => AccountPage()),
      ],
    );
  }
}
