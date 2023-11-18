import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../models/graph_data.dart';
import '../styles/app_font_size.dart';

class Graph extends StatelessWidget {
  const Graph({super.key});

  static const List<GraphData> _fakeGraphDataList = [
    GraphData(0),
    GraphData(5),
    GraphData(2),
    GraphData(3),
    GraphData(4),
    GraphData(5),
    GraphData(10),
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(24),
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
        maxX: 6,
        minY: 0,
        maxY: 6,
        borderData: FlBorderData(show: true),
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
        belowBarData: BarAreaData(show: true),
        dotData: const FlDotData(show: false),
      ),
    ];
  }

  // Reads all GraphData objects in order, if the object's data is not between 0 and 6, returns 0
  // It also don't accept more than 7 data objects.
  List<FlSpot> getGraphData() {
    List<FlSpot> spots = [];
    for (var i = 0; i < _fakeGraphDataList.length; i++) {
      if (spots.length >= 7) break;
      if (_fakeGraphDataList[i].isValid()) {
        spots.add(FlSpot(i.toDouble(), _fakeGraphDataList[i].y.toDouble()));
      } else {
        spots.add(FlSpot(i.toDouble(), 0));
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
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: bottomGraphDataWidgets,
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

  Widget bottomGraphDataWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '10AM';
        break;
      case 1:
        text = '11AM';
        break;
      case 2:
        text = '12PM';
        break;
      case 3:
        text = '01PM';
        break;
      case 4:
        text = '02PM';
        break;
      case 5:
        text = '03PM';
        break;
      case 6:
        text = '04PM';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: bottomGraphDataWidgetsStyle(text: text),
    );
  }

  Widget bottomGraphDataWidgetsStyle({
    required String text,
  }) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: AppFontSize.smallTextGraph,
      ),
    );
  }
}
