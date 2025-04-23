import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/wallet.dart';
import 'package:project_1/models/income.dart';
import 'package:project_1/models/spend.dart';
import 'package:project_1/views/dashboard/wallet/transactionItemCollectionConceretes/addIncome.dart';
import 'package:project_1/views/dashboard/wallet/transactionItemCollectionConceretes/addSpend.dart';
import 'package:project_1/views/dashboard/wallet/collectionLayoutBuilder.dart';
import 'package:project_1/views/dashboard/wallet/transactionItemCollectionConceretes/incomesCollection.dart';
import 'package:project_1/views/dashboard/wallet/transactionItemCollectionConceretes/spendsCollection.dart';
import 'package:project_1/views/dashboard/wallet/transactionItemCollection.dart';

import 'wallet/listView.dart';

class WalletWidget extends StatelessWidget {
  final controller = Get.find<WalletController>();

  WalletWidget({super.key}) {
    itemCollections = [
      Spendscollection(itemList: controller.spends),
      Incomescollection(itemList: controller.incomes),
    ];
  }

  Widget _getResponsiveGridView(
    BuildContext context, {
    required List<Widget> children,
  }) {
    final gridElementMaxWidth = 500.0;
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > gridElementMaxWidth ? 2 : 1;
    final antiCrossAxisCount = crossAxisCount == 1 ? 2 : 1;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: gridElementMaxWidth * 2,
          maxHeight: gridElementMaxWidth * antiCrossAxisCount,
        ),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: children,
        ),
      ),
    );
  }

  List<Transactionitemcollection> itemCollections = [];
  Collectionlayoutbuilder collectionlayoutbuilder =
      ConcreteCollectionLayoutBuilder();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Obx(
            () => Text(
              "Balance: ${controller.getBalance()}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        Expanded(
          child: _getResponsiveGridView(
            context,
            children:
                itemCollections
                    .map(
                      (itemCollection) => collectionlayoutbuilder.build(
                        context,
                        itemCollection,
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}
