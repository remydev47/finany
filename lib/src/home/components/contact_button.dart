import 'package:finany/common/utils/kcolors.dart';
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
            ContactButton(imageUrl: 'assets/search_icon.png', label: 'Search'),
            ContactButton(imageUrl: 'assets/anne.jpg', label: 'Anne'),
            ContactButton(imageUrl: 'assets/kate.jpg', label: 'Kate'),
            ContactButton(imageUrl: 'assets/edward.jpg', label: 'Edward'),
            ContactButton(imageUrl: 'assets/phillip.jpg', label: 'Phillip'),
            ContactButton(imageUrl: 'assets/emma.jpg', label: 'Emma'),
          ],
        ),
      ),
    );
  }
}
class ContactButton extends StatelessWidget {
  final String imageUrl;
  final String label;

  ContactButton({required this.imageUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60, // Adjust width as needed
      margin: EdgeInsets.only(right: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey[200],
            child: ClipOval(
              child: Image.asset(
                imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
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
