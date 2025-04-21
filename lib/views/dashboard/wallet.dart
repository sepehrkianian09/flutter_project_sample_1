import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/wallet.dart';
import 'package:project_1/models/income.dart';
import 'package:project_1/models/spend.dart';

class SpendIncomeLayoutWidget extends StatelessWidget {
  final elements;

  const SpendIncomeLayoutWidget({this.elements});

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      child: ListView(
        children:
            elements
                .map<Widget>(
                  (element) => Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                      vertical: 3.0,
                      horizontal: 4.0,
                    ),
                    color: Colors.red,
                    child: Text(element.toString()),
                  ),
                )
                .toList(),
      ),
    );
  }
}

class WalletWidget extends StatelessWidget {
  final _controller = Get.find<WalletController>();

  Widget getCenteredWidget({required children}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text("Balance: ${_controller.getBalance()}")),
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
                        elements: _controller.getSpends(),
                      ),
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
                        elements: _controller.getIncomes(),
                      ),
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
