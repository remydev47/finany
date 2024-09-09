import 'package:finany/common/utils/kcolors.dart';
import 'package:finany/common/widgets/app_style.dart';
import 'package:finany/const/resource.dart';
import 'package:finany/src/home/components/transaction_list.dart';
import 'package:finany/src/reports/components/finance_info.dart';
import 'package:finany/src/reports/components/tab_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Maindashboard extends StatelessWidget {
  bool showReport = false;
  Maindashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage(R.ASSETS_IMAGES_USER1_PNG),
                            ),
                            SizedBox(width: 8),
                            Column(
                              children: [
                                Text('Balance',
                                    style: appStyle(
                                        18,
                                        Kolors.kDark.withOpacity(.5),
                                        FontWeight.w500)),
                                Text('\$50,000',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: IconButton(
                                icon: Icon(Icons.add, color: Colors.white),
                                onPressed: () {
                                  // Add functionality here
                                  print('Add button pressed');
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TabButton(text: 'This Week', isActive: true),
                    TabButton(text: 'This Month', isActive: false),
                    TabButton(text: 'This Year', isActive: false),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: FinanceInfo(title: 'Income', amount: '\$ 45,520', backgroundColor: Colors.green[100]!, textColor: Colors.green)),
                    SizedBox(width: 16),
                    Expanded(
                        child: FinanceInfo(title: 'Expense', amount: '\$ 44,540', backgroundColor: Colors.red[100]!, textColor: Colors.red)),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ButtonStyle(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('View report'),
                      SizedBox(width: 20),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                  onPressed: () => context.go('/reportwidget'),
                ),
                SizedBox(height: 10),
                _buildMonthlyBudget(),
                SizedBox(height: 10),
                TransactionList()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMonthlyBudget() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Kolors.kPrimaryLight.withOpacity(.15),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          Row(
            children: [
              Image.asset(
                R.ASSETS_IMAGES_MB_PNG,
                width: 60,
                height: 60,
              )
            ],
          ),
          Column(
            children: [
              Text('Monthly Budget',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              Text('\$140 / Day'),
              SizedBox(
                width: 40,
              ),
            ],
          ),
          SizedBox(
            width: 80,
          ),
          Column(
            children: [
              Text('\$1,675 Exp',
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
              Text('of \$4,000', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}


