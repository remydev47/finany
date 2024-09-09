import 'package:flutter_svg/flutter_svg.dart'; 
import 'package:finany/common/utils/kcolors.dart';
import 'package:finany/common/widgets/app_style.dart';
import 'package:finany/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class StockInvest extends StatelessWidget {
  const StockInvest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.go('/stockpage');
          },
          icon: Icon(AntDesign.arrowleft),
        ),
        title: Text(
          'Invest',
          style: appStyle(14, Kolors.kDark, FontWeight.w500),
        ),
        actions: [
          IconButton(
            icon: Icon(AntDesign.search1),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Recently Viewed',
                style: Theme.of(context).textTheme.headlineLarge),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stockcard(
                  image: R.ASSETS_AP_PNG,
                  symbol: 'AAPL',
                  name: 'Apple',
                  price: 358.07,
                  change: 3.04,
                  svgColor: Kolors.kDark,
                  stockDetailsRoute: '/apple-details',
                ),
                SizedBox(
                  width: 10,
                ),
                Stockcard(
                  image: R.ASSETS_AM_PNG,
                  symbol: 'AMZ',
                  name: 'Amazon',
                  price: 358.07,
                  change: -1.04,
                  svgColor: Kolors.kGold,
                  stockDetailsRoute: '/amazon-details',
                ),
                SizedBox(
                  width: 10,
                ),
                Stockcard(
                  image: R.ASSETS_SP_PNG,
                  symbol: 'SPOT',
                  name: 'Spotify',
                  price: 358.07,
                  change: 3.04,
                  svgColor: Kolors.kGreen,
                  stockDetailsRoute: '/spotify-details',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Trending Stocks',
                style: Theme.of(context).textTheme.headlineMedium),
          ),
          Column(
            children: [
              TrendingStockItem(
                symbol: 'NFLX',
                name: 'Netflix',
                price: 1404.20,
                change: 3.04,
                svgLogoAsset: R.ASSETS_NF_PNG,
              ),
              TrendingStockItem(
                symbol: 'MCD',
                name: 'McDonald\'s',
                price: 1280.66,
                change: -1.20,
                svgLogoAsset: R.ASSETS_MC_PNG,
              ),
              TrendingStockItem(
                symbol: 'NVD',
                name: 'Nvidia',
                price: 3895.05,
                change: -3.04,
                svgLogoAsset: R.ASSETS_NV_PNG,
              ),
              TrendingStockItem(
                symbol: 'TS',
                name: 'Tesla',
                price: 180.66,
                change: -1.20,
                svgLogoAsset: R.ASSETS_TE_PNG,
              ),
              TrendingStockItem(
                symbol: 'SPX',
                name: 'Spacex',
                price: 895.05,
                change: 3.04,
                svgLogoAsset: R.ASSETS_SX_PNG,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Stockcard extends StatelessWidget {
  final String image;
  final String symbol;
  final String name;
  final double price;
  final double change;
  final Color svgColor;
  final String stockDetailsRoute;
  const Stockcard({
    Key? key,
    required this.symbol,
    required this.name,
    required this.price,
    required this.change,
    required this.image,
    required this.svgColor,
    required this.stockDetailsRoute,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/stock/$symbol'),
      child: Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
          color: Kolors.kOffWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                width: 40,
                height: 40,
                image,
                color: svgColor, // Set the color of the SVG
              ),
              Text(symbol, style:  Theme.of(context).textTheme.headlineSmall, ),
              Text(name, style: appStyle(12, Kolors.kDark, FontWeight.bold),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('\$${price.toStringAsFixed(2)}'),
                  SizedBox(width: 6,),
                  Text(
                    '${change > 0 ? '▲' : '▼'} ${change.abs()}%',
                    style: TextStyle(
                        color: change > 0 ? Colors.green : Colors.red),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TrendingStockItem extends StatelessWidget {
  final String symbol;
  final String name;
  final double price;
  final double change;
  final String svgLogoAsset;
  const TrendingStockItem({
    Key? key,
    required this.symbol,
    required this.name,
    required this.price,
    required this.change,
    required this.svgLogoAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Kolors.kWhite,
        child: SvgPicture.asset(
          svgLogoAsset,
           width: 24, // Add a width to ensure the SVG is visible
          height: 24,
        ),
      ),
      title: Text(name),
      subtitle: Text(symbol),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('\$${price.toStringAsFixed(2)}'),
          Text('${change > 0 ? '▲' : '▼'} ${change.abs()}%',
              style: TextStyle(color: change > 0 ? Colors.green : Colors.red)),
        ],
      ),
      
    );
  }
}
