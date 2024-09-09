import 'package:finany/animation/animation.dart';
import 'package:finany/src/cards/widgets/bank_card.dart';
import 'package:finany/src/cards/widgets/card_details.dart';
import 'package:finany/src/history/views/history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class AnimatedCardsWidget extends StatelessWidget {
  const AnimatedCardsWidget({
    super.key,
    required this.cardDetails,
  });

  final List<CardDetail> cardDetails;

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      delay: 3.5,
      direction: FadeInDirection.ltr,
      fadeOffset: 40,
      child: SizedBox(
        height: 260,
        child: CardSwiper(
          padding: const EdgeInsets.symmetric(vertical: 20),
          cardBuilder: (
            context,
            index,
            horizontalOffsetPercentage,
            verticalOffsetPercentage,
          ) {
            final cardDetail = cardDetails[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                  context, HistoryPage.route(cardDetail: cardDetail)),
              child: BankCard(
                  cardBgAsset: cardDetail.cardBgAsset,
                  balance: cardDetail.balance,
                  cardNumber: cardDetail.cardNumber),
            );
          },
          cardsCount: cardDetails.length,
          isLoop: true,
          numberOfCardsDisplayed: 3,
          scale: 0.95,
          backCardOffset: const Offset(18, -15),
        ),
      ),
    );
  }
}
