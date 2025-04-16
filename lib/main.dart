import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'account.dart';
import 'dashboard.dart';

Future<void> main() async {
  await initDataStorage();
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
