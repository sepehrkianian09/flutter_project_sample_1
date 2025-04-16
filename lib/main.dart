import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/user.dart';
import 'package:project_1/services/account.dart';
import 'package:project_1/services/login.dart';

import 'account.dart';
import 'dashboard.dart';

Future<void> main() async {
  await initDataStorage();

  Get.lazyPut<UserController>(() => UserController());

  Get.lazyPut<AccountService>(() => AccountService());
  Get.lazyPut<LoginService>(() => LoginService());

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
