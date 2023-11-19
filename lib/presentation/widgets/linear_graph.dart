import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_dashboard/presentation/styles/app_color.dart';
import '../../models/graph_data.dart';

class LinearGraph extends StatelessWidget {
  final List<GraphData> graphDataList;
  final int maxGraphDataPoints;
  final List<String> bottonLabelList;
  const LinearGraph({
    super.key,
    required this.graphDataList,
    required this.maxGraphDataPoints,
    required this.bottonLabelList,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: graph(),
      ),
    );
  }

  Widget graph() {
    return LineChart(
      LineChartData(
        lineBarsData: data(),
        titlesData: bottomGraph(),
        minX: 0,
        maxX: (maxGraphDataPoints - 1),
        minY: 0,
        maxY: 6,
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: false),
      ),
    );
  }

  List<LineChartBarData> data() {
    return [
      LineChartBarData(
        spots: getGraphData(),
        isCurved: true,
        barWidth: 4,
        color: AppColor.yellow,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColor.gradientColorsGraph
                .map((color) => color.withOpacity(0.4))
                .toList(),
          ),
        ),
        dotData: const FlDotData(show: false),
      ),
    ];
  }

  // Reads all GraphData objects in order, if the object's data is not between 0 and 6,
  // returns 0 or 6, depending if its under 0 or below 6.
  List<FlSpot> getGraphData() {
    List<FlSpot> spots = [];
    for (var i = 0; i < graphDataList.length; i++) {
      if (spots.length >= maxGraphDataPoints) break;
      if (graphDataList[i].isValid()) {
        spots.add(FlSpot(i.toDouble(), graphDataList[i].y.toDouble()));
      } else {
        if (graphDataList[i].y <= 0) {
          spots.add(FlSpot(i.toDouble(), 0));
        } else {
          spots.add(FlSpot(i.toDouble(), 6));
        }
      }
    }
    return spots;
  }

  FlTitlesData bottomGraph() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 100,
          interval: 1,
          getTitlesWidget: bottomLabelsWidgets,
        ),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
  }

  Widget bottomLabelsWidgets(double value, TitleMeta meta) {
    String text = getBottomGraphLabel(value);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        text,
        style: const TextStyle(fontSize: 10),
      ),
    );
  }

  String getBottomGraphLabel(double value) {
    int index = value.toInt();
    if (index >= 0 && index < bottonLabelList.length) {
      return bottonLabelList[index];
    }
    return '';
  }
}
