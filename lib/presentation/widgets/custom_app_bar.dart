import 'package:flutter/material.dart';

import '../styles/app_color.dart';
import '../styles/app_font_size.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  static const double _appbarSize = 100;

  @override
  Size get preferredSize => const Size.fromHeight(_appbarSize);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      backgroundColor: AppColor.yellow,
      elevation: 0,
      toolbarHeight: _appbarSize,
      title: title(),
      leading: circularImage(),
      actions: actions,
    );
  }

  Widget circularImage() {
    return Transform.scale(
      scale: 0.9,
      origin: const Offset(100, 0),
      child: CircleAvatar(
        child: Image.asset(
          'assets/images/ellipse_1557.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            'Snack City',
            style: TextStyle(
              fontSize: AppFontSize.appbarTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Subtitle
          const Text(
            'Proddatur Branch',
            style: TextStyle(
              fontSize: AppFontSize.appbarSubtitle,
              color: AppColor.white,
            ),
          ),
          // Switch
          Transform.scale(
            scale: 0.8,
            origin: const Offset(-40, 0),
            child: Switch(
              value: true,
              activeColor: AppColor.orange,
              activeTrackColor: AppColor.white,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> get actions {
    return const [
      // Shopping
      Icon(Icons.shopping_bag, size: 32, color: AppColor.grey),

      // Circle
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Icon(Icons.circle, size: 48, color: AppColor.grey),
      ),
    ];
  }
}
