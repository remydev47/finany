import 'package:finany/common/utils/kcolors.dart';
import 'package:finany/const/resource.dart';
import 'package:finany/src/reports/components/finance_info.dart';
import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Balance',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Kolors.kGrayLight),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '\$ 50,000',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Kolors.kDark),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage(
                      R.ASSETS_IMAGES_BULL_PNG,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: FinanceInfo(
                      title: 'Income',
                      amount: '\$ 45,520',
                      backgroundColor: Colors.blue[100]!,
                      textColor: Kolors.kDark)),
              SizedBox(width: 16),
              Expanded(
                  child: FinanceInfo(
                      title: 'Expense',
                      amount: '\$ 44,540',
                      backgroundColor: Colors.red[100]!,
                      textColor: Kolors.kDark)),
            ],
          ),
        ],
      ),
    );
  }
}
