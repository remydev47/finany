import 'package:finany/common/utils/kcolors.dart';
import 'package:finany/common/widgets/app_style.dart';
import 'package:finany/src/stocks/pages/stck_invest.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class StockDetailsPage extends StatelessWidget {
  final String symbol;
  //final String image;
  final String name;
  final double price;
  final double change;
  final double changePercentage;
  const StockDetailsPage({
    super.key,
    required this.symbol,
    required this.name,
    required this.price,
    required this.change,
    required this.changePercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.go('/stockinvest');
          },
          icon: Icon(AntDesign.arrowleft),
        ),
        title: Text(name, style:appStyle(24, Kolors.kDark,FontWeight.bold),),
        actions: [
          IconButton(
            icon: Icon(Icons.star_border),
            onPressed: () {/* Add to favorites */},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38.withOpacity(0.1),
                      offset: Offset(0, 2),
                      blurRadius: 3,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    SizedBox(
                      height: 24,
                    ),
                    _buildPriceInfo(),
                    SizedBox(height: 16),
                    _buildChart(),
                    SizedBox(height: 16),
                    _buildTimeFrameButtons(),
                  ],
                ),
              ),
             SizedBox(height: 18),
              _buildActionButtons(),
              SizedBox(height: 24),
              _buildStats(),
            ],
          ),

        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          child: Text(
            symbol[0],
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(symbol, style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '\$$price',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Text(
              '${change >= 0 ? '+' : ''}$change',
              style: TextStyle(
                color: change >= 0 ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(width: 8),
            Text(
              '${changePercentage >= 0 ? '+' : ''}${changePercentage.toStringAsFixed(2)}%',
              style: TextStyle(
                color: changePercentage >= 0 ? Colors.green : Colors.red,
                fontSize: 18,
              ),
            ),
            SizedBox(width: 8),
            Text('Past Month', style: TextStyle(color: Colors.grey)),
          ],
        ),
        SizedBox(height: 4),
        Text(
          'Closed: Nov 12, 7:59 PM EST • Disclaimer',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        Text(
          'After hours 149.73 -0.26 (0.17%)',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildChart() {
    return Container(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 3.1),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData:
                  BarAreaData(show: true, color: Colors.blue.withOpacity(0.2)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeFrameButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ['1d', '1w', '1m', 'All'].map((period) {
        return ElevatedButton(
          onPressed: () {/* TODO: Implement time frame change */},
          child: Text(period),
          style: ElevatedButton.styleFrom(
            foregroundColor: period == '1m' ? Colors.white : Colors.black,
            backgroundColor: period == '1m' ? Colors.blue : Colors.grey[200],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {/* TODO: Implement buy action */},
            child: Text('+ Buy', style: appStyle(14, Kolors.kOffWhite, FontWeight.bold)),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {/* TODO: Implement sell action */},
            child: Text('- Sell', style: appStyle(14, Kolors.kDark, FontWeight.bold),),
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.orange[300]),
          ),
        ),
      ],
    );
  }
  Widget _buildStats() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Stats',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        _buildStatRow('Open:', '\$177.16'),
        _buildStatRow('Days Range:', '\$177.16 - \$177.43'),
        _buildStatRow('S2-Week range:', '\$177.16'),
        _buildStatRow('Volume:', '\$7,177.16'),
        _buildStatRow('Avg Volume:', '\$297.136'),
      ],
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

}
