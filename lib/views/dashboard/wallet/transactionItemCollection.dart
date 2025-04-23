import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/views/dashboard/wallet/listView.dart';

abstract class Transactionitemcollection<E> {
  String getTitle();

  ListTile createElementTileWidget(int index, E anElement);

  final RxList<E> itemList;
  Transactionitemcollection({required this.itemList});

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
