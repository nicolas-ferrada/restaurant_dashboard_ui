import 'package:flutter/material.dart';

import '../styles/app_color.dart';

class LiveOrders extends StatelessWidget {
  const LiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(),
        const SizedBox(height: 8),
        stats(),
      ],
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
          fontSize: 15,
          color: AppColor.green,
          decoration: TextDecoration.underline,
          decorationColor: AppColor.green,
        ),
      ),
    );
  }

  Widget liveOrders() {
    return const Text(
      'Live Orders',
      style: TextStyle(fontSize: 21),
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
    return SizedBox(
      height: 105,
      width: 140,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            statsBuilderAmount(amount),
            statsBuilderSubtitle(subtitle),
          ],
        ),
      ),
    );
  }

  Widget statsBuilderSubtitle(String subtitle) {
    return Text(
      subtitle,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget statsBuilderAmount(int amount) {
    return Text(
      amount.toString(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: AppColor.grey,
        fontSize: 38,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
