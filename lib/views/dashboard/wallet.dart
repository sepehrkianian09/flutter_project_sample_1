import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/wallet.dart';
import 'package:project_1/views/dashboard/addIncome.dart';
import 'package:project_1/views/dashboard/addSpend.dart';

class SpendIncomeLayoutWidget extends StatelessWidget {
  final RxList elements;

  const SpendIncomeLayoutWidget({super.key, required this.elements});

  Widget _listView(BuildContext context) {
    return Obx(() {
      if (elements.isEmpty) {
        return Center(child: Text('No items yet.'));
      }
      return ListView.builder(
        itemCount: elements.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 4.0),
            color: Colors.red,
            child: Text(elements[index].toString()),
          );
          // return ListTile(
          //   title: Text(elements[index]),
          //   trailing: IconButton(
          //     icon: Icon(Icons.delete),
          //     onPressed: () => controller.removeItem(index),
          //   ),
          // );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      child: _listView(context),
    );
  }
}

class WalletWidget extends StatelessWidget {
  final controller = Get.find<WalletController>();

  WalletWidget({super.key});

  Widget getCenteredWidget({required children}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(children: children),
    );
  }

  void showModal(BuildContext context, Widget innerWidget) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) =>
              Padding(padding: const EdgeInsets.all(16.0), child: innerWidget),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Obx(() => Text("Balance: ${controller.getBalance()}"))),
        Expanded(
          child: Row(
            spacing: 5.0,
            children: [
              Expanded(
                child: getCenteredWidget(
                  children: [
                    Center(child: Text("Spends")),
                    Expanded(
                      child: SpendIncomeLayoutWidget(
                          elements: controller.spends,
                        ),
                    ),
                    ElevatedButton(
                      onPressed: () => showModal(context, AddSpendWidget()),
                      child: Text("Spend some"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: getCenteredWidget(
                  children: [
                    Center(child: Text("Incomes")),
                    Expanded(
                      child: SpendIncomeLayoutWidget(
                          elements: controller.incomes,
                        ),
                    ),
                    ElevatedButton(
                      onPressed: () => showModal(context, AddIncomeWidget()),
                      child: Text("Add Income"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
