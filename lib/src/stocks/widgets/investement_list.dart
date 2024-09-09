import 'package:finany/common/utils/kcolors.dart';
import 'package:finany/const/resource.dart';
import 'package:finany/src/stocks/widgets/investment_header_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InvestementList extends StatelessWidget {
  const InvestementList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildInvestmentItem('Apple', 'AAPL', 3, 280.90, 1404.20, 3.94, true),
        _buildInvestmentItem('Spotify', 'SP', 7, 80.90, 604.20, 3.94, true),
        _buildInvestmentItem(
            'Google', 'GOOGL', 2, 570.90, 1280.66, 1.20, false),
        _buildInvestmentItem('BMW', 'BW', 5, 814.38, 3895.05, 3.04, true),
        SizedBox(height: 16),
        InvestmentHeaderBuilder(title: 'Available to Invest'),
        Container(
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
          child: _buildAvailableInvestments(),
        ),
      ],
    );
  }

  Widget _buildInvestmentItem(
    String name,
    String ticker,
    int shares,
    double pricePerShare,
    double totalValue,
    double change,
    bool isPositive,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          _buildLogo(name),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
                Text(
                  '$shares Shares • \$${pricePerShare.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text('\$${totalValue.toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              Text(
                '${isPositive ? '▲' : '▼'} ${change.toStringAsFixed(2)}%',
                style: TextStyle(
                    color: isPositive ? Colors.green : Colors.red,
                    fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAvailableInvestments() {
    return Column(
      children: [
        _buildAvailableItem('AirBnB', 'BNB • Travel', 2451.65, 1.10, false),
        _buildAvailableItem('Amazon', 'AM • Ecommerce', 363.50, 2.59, true),
        _buildAvailableItem('Uber', 'UB • Transport', 47.51, 4.39, true),
      ],
    );
  }

  Widget _buildAvailableItem(String name, String details, double price,
      double change, bool isPositive) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          _buildLogo(name),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
                Text(details,
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$${price.toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              Text(
                '${isPositive ? '▲' : '▼'} ${change.toStringAsFixed(2)}%',
                style: TextStyle(
                    color: isPositive ? Colors.green : Colors.red,
                    fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buidAvailableItem(
    String name,
    String details,
    double price,
    double change,
    bool isPositive,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          _buildLogo(name),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
                Text(
                  details,
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$${price.toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              Text(
                '${isPositive ? '▲' : '▼'} ${change.toStringAsFixed(2)}%',
                style: TextStyle(
                    color: isPositive ? Colors.green : Colors.red,
                    fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLogo(String name) {
    String assetName = _getLogoAssetName(name);
    Color logoColor = _getLogoColor(name);
    return SvgPicture.asset(
      assetName,
      width: 30,
      height: 30,
      color: logoColor,
    );
  }
  String _getLogoAssetName(String name) {
    switch (name.toLowerCase()) {
      case 'apple':
        return R.ASSETS_AP_PNG;
      case 'spotify':
        return R.ASSETS_SP_PNG;
      case 'google':
        return R.ASSETS_GG_PNG;
      case 'bmw':
        return R.ASSETS_BW_PNG;
      case 'airbnb':
        return R.ASSETS_BB_PNG;
      case 'amazon':
        return R.ASSETS_AM_PNG;
      case 'uber':
        return R.ASSETS_UB_PNG;
      default:
        return R.ASSETS_AM_PNG;
    }
  }
  

  Color _getLogoColor(String name) {
    switch (name.toLowerCase()) {
      case 'apple':
        return Colors.black;
      case 'spotify':
        return Colors.green;
      case 'google':
        return Colors.blue;
      case 'bmw':
        return Colors.blue;
      case 'airbnb':
        return Colors.red[800]!;
      case 'amazon':
        return Colors.orange;
      
      case 'uber':
        return Colors.green;
      
      default:
        return Colors.grey;
    }
  }
}
