import 'package:flutter/material.dart';

class FinanceInfo extends StatelessWidget {
  const FinanceInfo({
    super.key,
    required this.title,
    required this.amount,
    required this.backgroundColor,
    required this.textColor,
  });

  final String title;
  final String amount;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // Define a fixed height for the card
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: textColor.withOpacity(0.7), fontSize: 14),
            ),
            SizedBox(height: 4),
            Text(
              amount,
              style: TextStyle(
                  color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
