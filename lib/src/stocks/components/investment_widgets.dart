import 'package:finany/animation/animation.dart';
import 'package:finany/src/stocks/widgets/investement_list.dart';
import 'package:finany/src/stocks/widgets/investment_header_builder.dart';
import 'package:flutter/material.dart';

class InvestmentWidget extends StatelessWidget {
  const InvestmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      delay: 3.5,
      direction: FadeInDirection.ttb,
      fadeOffset: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InvestmentHeaderBuilder(title: 'Investments'),
          SizedBox(height: 8,),
          InvestementList()
        ]
      ),
    );
  }
}