import 'package:flutter/material.dart';
import 'package:restaurant_dashboard/presentation/styles/app_color.dart';
import 'package:restaurant_dashboard/presentation/styles/app_font_size.dart';

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
          GestureDetector(
            onTap: () {},
            child: Text(
              'Revenue',
              style: selectedTabStyle(),
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Orders',
              style: TextStyle(fontSize: AppFontSize.text),
            ),
          ),
          seeDetailsButton(),
        ],
      ),
    );
  }

  TextStyle selectedTabStyle() {
    return const TextStyle(
      fontSize: AppFontSize.text,
      color: AppColor.yellow,
      decoration: TextDecoration.underline,
      decorationColor: AppColor.yellow,
    );
  }

  Widget seeDetailsButton() {
    return Flexible(
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {},
          child: const Text(
            'See Details',
            style: TextStyle(
              color: AppColor.grey,
              decoration: TextDecoration.underline,
              fontSize: AppFontSize.text,
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
        fontSize: AppFontSize.subtitle,
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
              fontSize: AppFontSize.text,
              color: AppColor.grey,
            ),
          ),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}
