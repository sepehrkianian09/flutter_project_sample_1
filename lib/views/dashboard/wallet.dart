import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  final List<Income> incomes = [
    Income(2.0, DateTime(2020, 10, 3, 10, 20, 3)),
    Income(4.0, DateTime(2016, 2, 5, 3, 56, 20)),
  ];
  final double totalIncome = 324.0;

  final List<Spend> spends = [
    Spend(2.0, DateTime(2020, 10, 3, 10, 20, 3), '1'),
    Spend(4.0, DateTime(2016, 2, 5, 3, 56, 20), '2'),
  ];
  final double totalSpent = 36.0;
  final double balance = 40.5;

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
        Center(child: Text("Balance: $balance")),
        Expanded(
          child: Row(
            spacing: 5.0,
            children: [
              Expanded(
                child: getCenteredWidget(
                  children: [
                    Center(child: Text("Spends")),
                    Expanded(child: SpendIncomeLayoutWidget(elements: spends)),
                    Center(child: Text("Total Spent: $totalSpent")),
                  ],
                ),
              ),
              Expanded(
                child: getCenteredWidget(
                  children: [
                    Center(child: Text("Incomes")),
                    Expanded(child: SpendIncomeLayoutWidget(elements: incomes)),
                    Center(child: Text("Total Income: $totalIncome")),
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
