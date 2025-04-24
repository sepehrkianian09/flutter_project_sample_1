import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/statistics.dart';
import 'package:project_1/views/dashboard/barChart.dart';
import 'package:project_1/views/dashboard/colorGenerator.dart';

class StatisticsWidget extends StatelessWidget {
  final _statisticsController = Get.find<StatisticsController>();

  StatisticsWidget({super.key});

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

  @override
  Widget build(BuildContext context) {
    final spentPerCategory = _statisticsController.getTotalSpentPerCategory();
    return _getResponsiveGridView(
      context,
      children: [
        Column(
          spacing: 20.0,
          children: [
            Text("Statistics", style: Theme.of(context).textTheme.titleLarge),
            Expanded(
              child: BarChartWidget(
                chartData: spentPerCategory,
                chartColorGenerator: RandomColorGenerator(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
