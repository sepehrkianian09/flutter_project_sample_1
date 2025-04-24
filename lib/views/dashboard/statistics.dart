import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/statistics.dart';

class StatisticsWidget extends StatelessWidget {
  final _statisticsController = Get.find<StatisticsController>();

  double _max(List<double> numbers) {
    if (numbers.isEmpty) {
      return 0;
    } else if (numbers.length == 1) {
      return numbers.first;
    }

    return numbers.reduce((a, b) => a > b ? a : b);
  }

  Widget _createBarChart(Map<String, double> chartData) {
    final chartXs = chartData.keys.toList();
    final maxValueOfChart =
        (_max(chartData.values.toList()) * 1.2).ceil() as double;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: maxValueOfChart,
        barTouchData: BarTouchData(enabled: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                return Text([...chartXs][value.toInt()]);
              },
            ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        barGroups:
            chartData.entries
                .map(
                  (mapEntry) => BarChartGroupData(
                    x: chartXs.indexOf(mapEntry.key),
                    barRods: [
                      BarChartRodData(toY: mapEntry.value, color: Colors.blue),
                    ],
                  ),
                )
                .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final spentPerCategory = _statisticsController.getTotalSpentPerCategory();
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(40.0),
      child: Column(
        spacing: 20.0,
        children: [
          Text("Statistics", style: Theme.of(context).textTheme.titleLarge),
          Expanded(child: _createBarChart(spentPerCategory)),
        ],
      ),
    );
  }
}
