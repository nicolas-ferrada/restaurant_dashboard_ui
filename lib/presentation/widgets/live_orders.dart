import 'package:flutter/material.dart';

import '../styles/app_color.dart';
import '../styles/app_font_size.dart';
import '../styles/app_font_style.dart';

class LiveOrders extends StatelessWidget {
  const LiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(),
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
      'Live Orders',
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
    return SizedBox(
      height: 120,
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
        fontWeight: AppFontStyle.weightStyle,
      ),
    );
  }

  Widget statsBuilderAmount(int amount) {
    return Text(
      amount.toString(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: AppColor.grey,
        fontSize: AppFontSize.bigText,
        fontWeight: AppFontStyle.weightStyle,
      ),
    );
  }
}
