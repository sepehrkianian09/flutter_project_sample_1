import 'package:flutter/material.dart';

class ResponsiveGridWidget extends StatelessWidget {
  final List<Widget> children;

  const ResponsiveGridWidget({super.key, required this.children});

  int _getCrossAxisCount(double screenWidth, double gridElementMaxWidth) {
    if (children.length == 1) {
      return 1;
    } else if (children.length == 2) {
      return screenWidth > gridElementMaxWidth ? 2 : 1;
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final gridElementMaxWidth = 500.0;
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = _getCrossAxisCount(screenWidth, gridElementMaxWidth);
    final antiCrossAxisCount = 3 - crossAxisCount;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: crossAxisCount * gridElementMaxWidth,
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
}