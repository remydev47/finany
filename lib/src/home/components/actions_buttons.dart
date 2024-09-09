import 'package:finany/common/utils/kcolors.dart';
import 'package:flutter/material.dart';

class ActionsButtons extends StatelessWidget {
  const ActionsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            TransactionButton(
              icon: Icons.add,
              label: 'Add Money',
            ),
            SizedBox(
              width: 16,
            ),
            TransactionButton(
              
              icon: Icons.send,
              label: 'Send Money',
            ),
            SizedBox(width: 16,),
            TransactionButton(
             
              icon: Icons.more_horiz,
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  

  TransactionButton({this.icon, required this.label,});

  @override
  Widget build(BuildContext context,) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Kolors.kGold,
          radius: 30, // Increased size for better touch targets
          child: icon != null ? Icon(icon) : Text(label[0]),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }
}