import 'package:flutter/material.dart';
import 'package:flutter/src/material/list_tile.dart';
import 'package:project_1/models/spend.dart';
import 'package:project_1/views/dashboard/collectionBuildingConceretes/addSpend.dart';
import 'package:project_1/views/utils/collectionBuilding/itemCollectionFunctionalities.dart';

class Spendscollection extends ItemCollectionFunctionalities<Spend> {
  Spendscollection({required super.itemList});

  @override
  ListTile createElementTileWidget(int index, Spend aSpend) {
    return ListTile(
      title: Text("Spend ${index + 1}"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getPropertyUnderlinedText(
            property: "Amount",
            value: aSpend.amount.toString(),
          ),
          getPropertyUnderlinedText(
            property: "Date",
            value: aSpend.date.toString(),
          ),
          getPropertyUnderlinedText(
            property: "CategoryId",
            value: aSpend.categoryId,
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
    return "Spend";
  }

  @override
  Widget getAddItemWidget() {
    return AddSpendWidget();
  }
}
