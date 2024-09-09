
import 'package:finany/animation/animation.dart';
import 'package:finany/common/utils/kcolors.dart';
import 'package:finany/src/reports/components/bar_chart.dart';
import 'package:finany/src/reports/components/report_card.dart';
import 'package:finany/src/reports/components/tab_button.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/pie_chart.dart';

class ReportWidget extends StatelessWidget {
  const ReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      delay: 2,
      direction: FadeInDirection.rtl,
      fadeOffset: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.go('/report'),
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('Report'),
          actions: [
            IconButton(
              onPressed: () => context.go('/calendar'),
              icon: Icon(Icons.calendar_month),
            ),
          ],
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TabButton(text: 'This Week', isActive: true),
                TabButton(text: 'This Month', isActive: false),
                TabButton(text: 'This Year', isActive: false),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ReportCard(),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Income & Expense',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Kolors.kWhite,
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
              child: BarChartSample2(),
            ),
            SizedBox(height: 8),
           
            PieChartSample2()
          ],
        ),
      ),
    );
  }
}
