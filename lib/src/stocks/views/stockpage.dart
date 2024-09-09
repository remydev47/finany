import 'package:finany/common/utils/kcolors.dart';
import 'package:finany/const/resource.dart';
import 'package:finany/src/stocks/components/investment_widgets.dart';
import 'package:finany/src/stocks/components/stock_card.dart';
import 'package:finany/src/stocks/widgets/investement_list.dart';
import 'package:flutter/material.dart';

class Stockpage extends StatelessWidget {
  const Stockpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kolors.kOffWhite,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(R.ASSETS_IMAGES_USER1_PNG),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.star_outline,
                color: Kolors.kDark,
                size: 32,
              ),
              onPressed: () {}),
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: Kolors.kDark,
              size: 32,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                StockCard(),
                SizedBox(height: 12,),
                InvestmentWidget()
              ],
            ),
          )
        ],
      ),
    );
  }
}
