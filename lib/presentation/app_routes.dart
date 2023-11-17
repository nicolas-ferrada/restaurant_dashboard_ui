import 'package:flutter/material.dart';
import 'screens/restaurant_dashboard_screen.dart';

class AppRoutes {
  static const restaurantDashboardRoute = '/restaurant-dashboard';

  static Map<String, Widget Function(BuildContext)> routes = {
    restaurantDashboardRoute: (context) => const RestaurantDashboardScreen(),
  };
}
