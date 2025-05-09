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

  @override
  Widget build(BuildContext context) {
    if (!controller.isLoggedIn()) {
      Future.delayed(Duration.zero, () {
        Get.toNamed('/account?hasAccount=true');
      });
    }

    return Scaffold(
      appBar: _getAppBar(),
      body: _getPage(_selectedIndex()),
      bottomNavigationBar: getBottomNavigator(context),
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

  final List<String> subPageIndex = ['statistics', 'wallet', 'categories'];

  int _selectedIndex() {
    final String subPage = Get.parameters['subpage']!;
    return subPageIndex.indexOf(subPage);
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return StatisticsWidget();
      case 1:
        return WalletWidget();
      case 2:
        return CategoriesWidget();
      default:
        return Text("");
    }
  }

  FinancialAppLayout({super.key});

  void _onItemTapped(int index) {
    Get.toNamed('/dashboard/${subPageIndex[index]}');
  }

  Widget getBottomNavigator(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex(),
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
