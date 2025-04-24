import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/statistics.dart';
import 'package:project_1/views/utils/barChart.dart';
import 'package:project_1/views/utils/colorGenerator.dart';
import 'package:project_1/views/utils/responsiveGrid.dart';

class StatisticsWidget extends StatelessWidget {
  final _statisticsController = Get.find<StatisticsController>();

  StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final spentPerCategory = _statisticsController.getTotalSpentPerCategory();
    return ResponsiveGridWidget(
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
