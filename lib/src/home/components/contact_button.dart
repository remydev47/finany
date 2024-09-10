import 'package:finany/common/utils/kcolors.dart';
import 'package:finany/const/resource.dart';
import 'package:flutter/material.dart';

class ContactButtons extends StatelessWidget {
  const ContactButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Kolors.kWhite.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            ContactButton(imageAsset: R.ASSETS_USER2_PNG, label: 'Anne'),
            ContactButton(imageAsset: R.ASSETS_USER3_PNG, label: 'Kate'),
            ContactButton(imageAsset: R.ASSETS_USER4_PNG, label: 'Edward'),
            ContactButton(imageAsset: R.ASSETS_USER5_PNG, label: 'Phillip'),
            ContactButton(imageAsset: R.ASSETS_USER6_PNG, label: 'Emma'),
          ],
        ),
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  final String imageAsset;
  final String label;

  ContactButton({required this.imageAsset, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60, // Adjust width as needed
      margin: EdgeInsets.only(right: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imageAsset),
            radius: 30, // adjust the radius to your liking
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
