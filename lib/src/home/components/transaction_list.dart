import 'package:finany/animation/animation.dart';
import 'package:finany/common/utils/kcolors.dart';
import 'package:finany/const/resource.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      delay: 3.5,
      direction: FadeInDirection.ltr,
      fadeOffset: 40,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Kolors.kOffWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.1),
              offset: Offset(0, 2),
              blurRadius: 3,
            )
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'Transactions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  TextButton(
                    child: Text(
                      'See all',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            TransactionItem(
              iconAsset: R.ASSETS_ICON_1PNG,
              iconColor: Colors.orange,
              title: 'Food',
              date: '14 April 2019',
              amount: '\$450.50',
            ),
            TransactionItem(
              iconAsset: R.ASSETS_ICON_2PNG,
              iconColor: Colors.green,
              title: 'Medicine',
              date: '14 April 2019',
              amount: '\$29.50',
            ),
            TransactionItem(
              iconAsset: R.ASSETS_ICON_3PNG,
              iconColor: Colors.grey,
              title: 'Energy',
              date: '14 April 2019',
              amount: '\$45.99',
            ),
            TransactionItem(
              iconAsset: R.ASSETS_ICON7_PNG,
              iconColor: Colors.deepOrange,
              title: 'Fitness',
              date: '14 April 2019',
              amount: '\$45.99',
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String iconAsset;
  final Color iconColor;
  final String title;
  final String date;
  final String amount;

  TransactionItem({
    required this.iconAsset,
    required this.iconColor,
    required this.title,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                iconAsset,
                width: 24,
                height: 24,
                color: iconColor,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
