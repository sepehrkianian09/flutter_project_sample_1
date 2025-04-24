import 'package:flutter/material.dart';
import 'package:project_1/models/category.dart';
import 'package:project_1/views/dashboard/collectionBuildingConceretes/addCategory.dart';
import 'package:project_1/views/utils/collectionBuilding/itemCollectionFunctionalities.dart';

class CategoryItemsCollection extends ItemCollectionFunctionalities<Category> {
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