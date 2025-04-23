import 'package:flutter/material.dart';
import 'package:flutter/src/material/list_tile.dart';
import 'package:project_1/models/income.dart';
import 'package:project_1/views/dashboard/wallet/transactionItemCollectionConceretes/addIncome.dart';
import 'package:project_1/views/dashboard/wallet/transactionItemCollection.dart';

class Incomescollection extends Transactionitemcollection<Income> {
  Incomescollection({required super.itemList});

  @override
  ListTile createElementTileWidget(int index, Income anIncome) {
    return ListTile(
      title: Text("Income ${index + 1}"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getPropertyUnderlinedText(
            property: "Amount",
            value: anIncome.amount.toString(),
          ),
          getPropertyUnderlinedText(
            property: "Date",
            value: anIncome.date.toString(),
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => print('deleted'),
      ),
    );
  }

  @override
  String getTitle() {
    return "Income";
  }

  @override
  Widget getAddItemWidget() {
    return AddIncomeWidget();
  }
}
