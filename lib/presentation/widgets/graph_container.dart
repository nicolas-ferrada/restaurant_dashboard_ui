import 'package:flutter/material.dart';
import 'package:restaurant_dashboard/presentation/styles/app_color.dart';

class GraphContainer extends StatelessWidget {
  final Widget graph;
  const GraphContainer({
    super.key,
    required this.graph,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          topOptions(),
          revenueAndFormatTab(),
          const SizedBox(height: 8),
          graph,
        ],
      ),
    );
  }

  Widget revenueAndFormatTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          totalRevenue(),
          formatTab(),
        ],
      ),
    );
  }

  Widget topOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Text(
            'Revenue',
            style: TextStyle(
              fontSize: 18,
              color: AppColor.grey,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
            ),
          ),
          seeDetailsButton(),
        ],
      ),
    );
  }

  Widget seeDetailsButton() {
    return Flexible(
      child: Align(
        alignment: Alignment.centerRight,
        child: Material(
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {},
            child: const Text(
              'See Details',
              style: TextStyle(
                color: AppColor.grey,
                decoration: TextDecoration.underline,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget totalRevenue() {
    return const Text(
      '\$2,241',
      style: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget formatTab() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Row(
        children: [
          Text(
            'Daily',
            style: TextStyle(
              fontSize: 15,
              color: AppColor.grey,
            ),
          ),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}
