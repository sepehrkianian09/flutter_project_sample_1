import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletListWidget<E> extends StatelessWidget {
  final RxList<E> elements;
  final ListTile Function(int, E) elementWidgetMaker;

  const WalletListWidget({
    super.key,
    required this.elements,
    required this.elementWidgetMaker,
  });

  Widget _listView(BuildContext context) {
    return Obx(() {
      if (elements.isEmpty) {
        return Center(child: Text('No items yet.'));
      }
      return ListView.builder(
        itemCount: elements.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4, // shadow depth
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: elementWidgetMaker(index, elements[index]),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // color: Colors.blue,
      child: _listView(context),
    );
  }
}
