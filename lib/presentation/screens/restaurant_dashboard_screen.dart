import 'package:flutter/material.dart';

import '../widgets/body.dart';

class RestaurantDashboardScreen extends StatelessWidget {
  const RestaurantDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(
        bodyWidgets: [
          Text('Restaurant Dashboard'),
        ],
      ),
    );
  }
}
