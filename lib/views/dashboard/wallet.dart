import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/wallet.dart';
import 'package:project_1/views/utils/collectionBuilding/collectionLayoutBuilder.dart';
import 'package:project_1/views/dashboard/collectionBuildingConceretes/incomesCollection.dart';
import 'package:project_1/views/dashboard/collectionBuildingConceretes/spendsCollection.dart';
import 'package:project_1/views/utils/collectionBuilding/itemCollectionFunctionalities.dart';
import 'package:project_1/views/utils/responsiveGrid.dart';

class WalletWidget extends StatelessWidget {
  final controller = Get.find<WalletController>();

  WalletWidget({super.key}) {
    itemCollections.addAll([
      Spendscollection(itemList: controller.spends),
      Incomescollection(itemList: controller.incomes),
    ]);
  }

  final List<ItemCollectionFunctionalities> itemCollections = [];
  final Collectionlayoutbuilder collectionlayoutbuilder =
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
          child: ResponsiveGridWidget(
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
