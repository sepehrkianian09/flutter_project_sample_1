import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/category.dart';
import 'package:project_1/views/dashboard/collectionBuildingConceretes/categoriesCollection.dart';
import 'package:project_1/views/utils/collectionBuilding/itemCollectionFunctionalities.dart';
import 'package:project_1/views/utils/responsiveGrid.dart';

import '../utils/collectionBuilding/collectionLayoutBuilder.dart';


class CategoriesWidget extends StatelessWidget {
  final _controller = Get.find<CategoryController>();

  CategoriesWidget({super.key}) {
    itemCollections.addAll([
      CategoryItemsCollection(itemList: _controller.categories),
    ]);
  }

  final List<ItemCollectionFunctionalities> itemCollections = [];
  final Collectionlayoutbuilder collectionlayoutbuilder =
      ConcreteCollectionLayoutBuilder();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
