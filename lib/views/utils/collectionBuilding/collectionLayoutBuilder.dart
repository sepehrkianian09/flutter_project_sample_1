import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_1/views/utils/collectionBuilding/listViewWidget.dart';
import 'package:project_1/views/utils/collectionBuilding/itemCollectionFunctionalities.dart';

abstract class Collectionlayoutbuilder {
  Widget build(
    BuildContext context,
    ItemCollectionFunctionalities itemCollection,
  );
}

class ConcreteCollectionLayoutBuilder extends Collectionlayoutbuilder {
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
  Widget build(
    BuildContext context,
    ItemCollectionFunctionalities itemCollection,
  ) {
    return getCenteredWidget(
      children: [
        Center(
          child: Text(
            itemCollection.getTitle(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: ListViewWidget(
            elements: itemCollection.itemList,
            elementWidgetMaker: itemCollection.createElementTileWidget,
          ),
        ),
        ElevatedButton(
          onPressed:
              () => showModal(context, itemCollection.getAddItemWidget()),
          child: Text("Add ${itemCollection.getTitle()}"),
        ),
      ],
    );
  }
}
