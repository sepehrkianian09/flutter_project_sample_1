import 'package:flutter/material.dart';
import 'package:flutter/src/material/list_tile.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/category.dart';
import 'package:project_1/models/category.dart';
import 'package:project_1/views/dashboard/addCategory.dart';
import 'package:project_1/views/dashboard/wallet/transactionItemCollection.dart';

import 'wallet/collectionLayoutBuilder.dart';

class CategoryItemsCollection extends Transactionitemcollection<Category> {
  CategoryItemsCollection({required super.itemList});

  @override
  ListTile createElementTileWidget(int index, Category aCategory) {
    return ListTile(
      title: Text("Category ${index + 1}"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getPropertyUnderlinedText(property: "Name", value: aCategory.name),
        ],
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => print('deleted'),
      ),
    );
  }

  @override
  Widget getAddItemWidget() {
    return AddCategoryWidget();
  }

  @override
  String getTitle() {
    return "Category";
  }
}

class CategoriesWidget extends StatelessWidget {
  final _controller = Get.find<CategoryController>();

  CategoriesWidget({super.key}) {
    itemCollections = [
      CategoryItemsCollection(itemList: _controller.categories),
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
          maxWidth: gridElementMaxWidth,
          maxHeight: gridElementMaxWidth * antiCrossAxisCount,
        ),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 1,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: children,
        ),
      ),
    );
  }

  List<Transactionitemcollection> itemCollections = [];
  final Collectionlayoutbuilder collectionlayoutbuilder =
      ConcreteCollectionLayoutBuilder();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
