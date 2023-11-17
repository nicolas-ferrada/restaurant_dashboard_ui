import 'package:flutter/material.dart';
import 'package:restaurant_dashboard/presentation/widgets/custom_app_bar.dart';
import 'package:restaurant_dashboard/presentation/widgets/live_orders.dart';

import '../widgets/body.dart';

class RestaurantDashboardScreen extends StatelessWidget {
  const RestaurantDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Body(
        bodyWidgets: [
          LiveOrders(),
        ],
      ),
    );
  }
}
