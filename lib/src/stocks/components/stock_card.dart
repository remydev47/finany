import 'package:finany/common/utils/app_routes.dart';
import 'package:finany/common/utils/kcolors.dart';
import 'package:finany/common/widgets/app_style.dart';
import 'package:finany/const/resource.dart';
import 'package:finany/src/home/components/actions_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class StockCard extends StatelessWidget {
  const StockCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        top: 16,
        right: 16,
        bottom: 16,
      ),
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
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '5,240.50',
                      style: appStyle(24, Kolors.kDark, FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Row(
                      children: [
                        Text('+590.25', style: TextStyle(color: Colors.green)),
                        SizedBox(width: 8),
                        Text('3.04%', style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(R.ASSETS_IMAGES_BULL_PNG),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(Icons.add, 'Add money', Colors.blue[50]!,
                    Colors.blue, () {}),
                _buildActionButton(Icons.show_chart, 'Invest',
                    Colors.orange[50]!, Colors.orange, () {
                  context.go('/stockinvest');
                }),
                _buildActionButton(Icons.grid_view, 'More', Colors.green[50]!,
                    Colors.green, () {}),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color bgColor,
      Color iconColor, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed, // You need to add a callback function here
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(bgColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        padding: WidgetStateProperty.all(EdgeInsets.all(16)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 28),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
