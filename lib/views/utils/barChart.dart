import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_1/views/utils/colorGenerator.dart';

class BarChartWidget extends StatelessWidget {
  final Map<String, double> chartData;

  final ColorGenerator chartColorGenerator;

  const BarChartWidget({
    super.key,
    required this.chartData,
    required this.chartColorGenerator,
  });

  double _max(List<double> numbers) {
    if (numbers.isEmpty) {
      return 0;
    } else if (numbers.length == 1) {
      return numbers.first;
    }

    return numbers.reduce((a, b) => a > b ? a : b);
  }

  @override
  Widget build(BuildContext context) {
    final chartXs = chartData.keys.toList();
    final chartYs = chartData.values.toList();
    final maxValueOfChart =
        (_max(chartData.values.toList()) * 1.2).ceil() as double;

    final colors = chartColorGenerator.generate(steps: chartData.length);

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
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                return Text(
                  value.toString(),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                );
              },
            ),
          ),
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
                      BarChartRodData(
                        toY: mapEntry.value,
                        color: colors[chartXs.indexOf(mapEntry.key)],
                      ),
                    ],
                  ),
                )
                .toList(),
      ),
    );
  }
}
