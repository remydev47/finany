import 'package:flutter/material.dart';

class InvestmentHeaderBuilder extends StatelessWidget {
  final String title;
  bool showSeeAll = true;
 InvestmentHeaderBuilder({super.key, required this.title, });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      if (showSeeAll)
        Text(
          'See all',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
        ),
      ]
    );
  }
}