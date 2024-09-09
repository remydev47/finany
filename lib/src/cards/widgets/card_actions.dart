import 'package:finany/animation/animation.dart';
import 'package:flutter/material.dart';

class CardActions extends StatelessWidget {
  final actions = [
    {
      'icon': Icons.pie_chart,
      'label': 'Card info',
      'color': Colors.blue,
    },
    {
      'icon': Icons.settings,
      'label': 'Card Options',
      'color': Colors.orange,
    },
    {
      'icon': Icons.account_balance_wallet,
      'label': 'Withdraw',
      'color': Colors.green
    },
    {
      'icon': Icons.currency_exchange,
      'label': 'Converter',
      'color': Colors.purple
    },
  ];
  CardActions({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      delay: 1,
      fadeOffset: 60,
      direction: FadeInDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: actions.map((action) => _buildActionButton(
          action['icon'] as IconData,
          action['label'] as String,
          action['color'] as Color,
        )).toList(),
      ),
    );
  }
  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
