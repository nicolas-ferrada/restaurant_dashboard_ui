import 'package:flutter/material.dart';
import 'package:restaurant_dashboard/models/item.dart';

import '../../models/graph_data.dart';
import '../widgets/body.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/linear_graph.dart';
import '../widgets/graph_container.dart';
import '../widgets/live_orders.dart';
import '../widgets/popular_items_week.dart';

class RestaurantDashboardScreen extends StatelessWidget {
  const RestaurantDashboardScreen({super.key});

  static const List<GraphData> graphDataList = [
    GraphData(0),
    GraphData(2),
    GraphData(1),
    GraphData(3),
    GraphData(2),
    GraphData(4),
    GraphData(3),
  ];

  static const List<String> bottonLabelList = [
    '10AM',
    '11AM',
    '12PM',
    '01PM',
    '02PM',
    '03PM',
    '04PM',
  ];

  static const List<Item> popularItemThisWeek = [
    Item(),
    Item(),
    Item(),
    Item(),
    Item(),
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Body(
          bodyWidgets: [
            LiveOrders(),
            SizedBox(height: 16),
            GraphContainer(
              graph: LinearGraph(
                graphDataList: graphDataList,
                maxGraphDataPoints: 7,
                bottonLabelList: bottonLabelList,
              ),
            ),
            SizedBox(height: 16),
            PopularItemsWeek(
              popularItemsWeek: popularItemThisWeek,
            ),
          ],
        ),
      ),
    );
  }
}
