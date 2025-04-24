import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/user.dart';
import 'package:project_1/views/dashboard/wallet.dart';

import 'dashboard/categories.dart';
import 'dashboard/statistics.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FinancialAppLayout();
  }
}

class FinancialAppLayout extends StatelessWidget {
  final controller = Get.find<UserController>();

  FinancialAppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    if (!controller.isLoggedIn()) {
      Future.delayed(Duration.zero, () {
        Get.toNamed('/account?hasAccount=true');
      });
    }

    return Scaffold(
      appBar: _getAppBar(),
      body: Obx(() => _pages[_selectedIndex.value]),
      bottomNavigationBar: Obx(() => getBottomNavigator(context)),
    );
  }

  void logout() {
    controller.logout();
    Get.toNamed('/account?hasAccount=true');
  }

  AppBar _getAppBar() {
    return AppBar(
      title: const Text('Financial App'),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          tooltip: 'Logout',
          onPressed: logout,
        ),
      ],
    );
  }

  final RxInt _selectedIndex = 1.obs;

  final List<Widget> _pages = <Widget>[
    StatisticsWidget(),
    WalletWidget(),
    CategoriesWidget(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  Widget getBottomNavigator(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex.value,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics),
          label: 'Statistics',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Categories',
        ),
      ],
    );
  }
}
