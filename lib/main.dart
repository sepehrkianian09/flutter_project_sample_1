import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/configurer.dart';

import 'views/account.dart';
import 'views/dashboard.dart';

Future<void> main() async {
  await Configurer().specify();
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
