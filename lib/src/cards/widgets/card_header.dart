import 'package:finany/common/utils/kcolors.dart';
import 'package:finany/common/widgets/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Cards',
          style: appStyle(20, Kolors.kDark, FontWeight.w500),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          label: Text(
            'Add Card',
            style: appStyle(16, Kolors.kGreen, FontWeight.w500),
          ),
          icon: Icon(
            Ionicons.add,
            color: Kolors.kPrimaryLight,
          ),
        )
      ],
    );
  }
}
