import 'package:flutter/material.dart';
import 'package:restaurant_dashboard/presentation/styles/app_color.dart';
import 'package:restaurant_dashboard/presentation/styles/app_font_size.dart';
import 'package:restaurant_dashboard/presentation/styles/app_font_style.dart';

class LiveOrders extends StatelessWidget {
  const LiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          header(),
          stats(),
        ],
      ),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        liveOrders(),
        orderHistoryButton(),
      ],
    );
  }

  Widget orderHistoryButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () {},
      child: const Text(
        'Order History',
        style: TextStyle(
          fontSize: AppFontSize.text,
          color: AppColor.yellow,
          decoration: AppFontStyle.underlinedStyle,
          decorationColor: AppColor.yellow,
        ),
      ),
    );
  }

  Widget liveOrders() {
    return const Text(
      'Live orders',
      style: TextStyle(fontSize: AppFontSize.subtitle),
    );
  }

  Widget stats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        statsBuilder(amount: 20, subtitle: 'RUNNING ORDERS'),
        statsBuilder(amount: 05, subtitle: 'ORDERS REQUEST'),
      ],
    );
  }

  Widget statsBuilder({
    required int amount,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 100,
        width: 140,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  amount.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColor.grey, fontSize: 38),
                ),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColor.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
