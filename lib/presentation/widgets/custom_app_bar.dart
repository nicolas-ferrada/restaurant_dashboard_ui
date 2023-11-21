import 'package:flutter/material.dart';

import '../styles/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  static const double _appbarSize = 100;

  @override
  Size get preferredSize => const Size.fromHeight(_appbarSize);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      backgroundColor: AppColor.green,
      elevation: 0,
      toolbarHeight: _appbarSize,
      title: title(),
      leading: userPictureProfile(),
      actions: actions,
    );
  }

  Widget userPictureProfile() {
    return Transform.scale(
      scale: 0.9,
      origin: const Offset(100, 0),
      child: CircleAvatar(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            'assets/images/default_user_profile.png',
            fit: BoxFit.cover,
          ),
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
            'Dashboard',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Subtitle
          const Text(
            'Proddatur',
            style: TextStyle(
              fontSize: 14,
              color: AppColor.white,
            ),
          ),
          // Switch
          Transform.scale(
            scale: 0.8,
            origin: const Offset(-40, 0),
            child: Switch(
              value: true,
              activeColor: AppColor.red,
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
      Padding(
        padding: EdgeInsets.only(right: 16),
        child: Icon(Icons.shopping_bag, size: 42, color: AppColor.grey),
      ),
    ];
  }
}
