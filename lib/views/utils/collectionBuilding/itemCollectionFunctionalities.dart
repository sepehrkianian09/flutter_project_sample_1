import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/views/utils/collectionBuilding/listViewWidget.dart';

abstract class ItemCollectionFunctionalities<E> {
  String getTitle();

  ListTile createElementTileWidget(int index, E anElement);

  final RxList<E> itemList;
  ItemCollectionFunctionalities({required this.itemList});

  Widget getAddItemWidget();

  Widget getPropertyUnderlinedText({
    required String property,
    required String value,
  }) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: property,
            style: TextStyle(decoration: TextDecoration.underline),
          ),
          TextSpan(text: ": $value"),
        ],
      ),
    );
  }
}
