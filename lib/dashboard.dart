import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FinancialAppLayout();
  }
}

class FinancialAppLayout extends StatelessWidget {
  const FinancialAppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.toNamed('/account');
    });

    return Scaffold(
      appBar: _getAppBar(),
      body: Center(child: Text('Home Page')),
      bottomNavigationBar: _getNavigationBar(),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      title: const Text('Financial App'),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          tooltip: 'Logout',
          onPressed: () => print('logged out'),
        ),
      ],
    );
  }

  Widget _getNavigationBar() {
    return FinancialAppBottomNavigationBar();
  }
}

class FinancialAppBottomNavigationBar extends StatelessWidget {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    Center(child: Text('Home Page')),
    Center(child: Text('Search Page')),
    Center(child: Text('Profile Page')),
  ];

  FinancialAppBottomNavigationBar({super.key});

  void _onItemTapped(int index) {
    _selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
