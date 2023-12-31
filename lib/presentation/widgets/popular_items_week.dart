import 'package:flutter/material.dart';
import 'package:restaurant_dashboard/presentation/styles/app_color.dart';

import '../../models/item.dart';

class PopularItemsWeek extends StatelessWidget {
  final List<Item> popularItemsWeek;
  const PopularItemsWeek({
    super.key,
    required this.popularItemsWeek,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColor.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleAndSeeAllButton(),
          itemBuilder(),
        ],
      ),
    );
  }

  Widget titleAndSeeAllButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Popular Items This Week',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16),
          ),
          Material(
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(25),
              child: const Text(
                'See All',
                style: TextStyle(
                  color: AppColor.grey,
                  decorationColor: AppColor.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemBuilder() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: popularItemsWeek.length,
        itemBuilder: (context, index) {
          return itemContainer(
            item: popularItemsWeek[index],
          );
        },
      ),
    );
  }

  Widget itemContainer({
    required Item item,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColor.grey,
          ),
        ),
      ),
    );
  }
}
