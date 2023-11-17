import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final List<Widget> bodyWidgets;
  const Body({
    super.key,
    required this.bodyWidgets,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                ...bodyWidgets,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
