import 'package:finany/animation/animation.dart';
import 'package:finany/const/resource.dart';
import 'package:finany/src/cards/widgets/animated_cards_widget.dart';
import 'package:finany/src/cards/widgets/bank_card.dart';
import 'package:finany/src/cards/widgets/card_actions.dart';
import 'package:finany/src/cards/widgets/card_details.dart';
import 'package:finany/src/cards/widgets/card_header.dart';
import 'package:finany/src/history/views/history_page.dart';
import 'package:finany/src/home/components/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class Cardspage extends StatelessWidget {
  const Cardspage({super.key});

  @override
  Widget build(BuildContext context) {
    const cardDetails = [
      CardDetail(
        cardBgAsset: R.ASSETS_IMAGES_P1_PNG,
        balance: '200,000.60',
        cardNumber: '4657',
      ),
      CardDetail(
          cardBgAsset: R.ASSETS_IMAGES_P3_PNG,
          balance: '848,900.30',
          cardNumber: '3486'),
      CardDetail(
        cardBgAsset: R.ASSETS_IMAGES_P2_PNG,
        balance: '350,800.90',
        cardNumber: '6343',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardHeader(),
              SizedBox(height: 16),
              AnimatedCardsWidget(cardDetails: cardDetails),
              SizedBox(height: 16),
              CardActions(),
              SizedBox(height: 16),
              TransactionList()
            ],
          ),
        ),
      ),
    );
  }
}


