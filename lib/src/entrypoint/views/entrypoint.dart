import 'package:finany/common/utils/kcolors.dart';
import 'package:finany/common/widgets/app_style.dart';
import 'package:finany/src/cards/views/cardspage.dart';
import 'package:finany/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:finany/src/home/views/home_page.dart';
import 'package:finany/src/reports/views/reportspage.dart';
import 'package:finany/src/stocks/views/stockpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Entrypoint extends StatelessWidget {
  Entrypoint({super.key});

  List<Widget> pageList = [
    const HomePage(),
    Reportspage(),
    const Stockpage(),
    const Cardspage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexNotifier>(
      builder: (context, tabIndexNotifier, child) {
        return Scaffold(
          body: Stack(
            children: [
              pageList[tabIndexNotifier.index],
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomNavigationBar(
                  
                  type: BottomNavigationBarType.fixed,
                  selectedFontSize: 12,
                  elevation: 0,
                  backgroundColor: Kolors.kOffWhite,
                  showSelectedLabels: true,
                  selectedLabelStyle:
                      appStyle(9, Kolors.kDark, FontWeight.w700),
                  showUnselectedLabels: true,
                  currentIndex: tabIndexNotifier.index,
                  selectedItemColor: Kolors.kPrimary,
                  unselectedIconTheme:
                      const IconThemeData(color: Kolors.kGrayLight),
                  selectedIconTheme:
                      const IconThemeData(color: Kolors.kPrimary),
                  onTap: (i) {
                    tabIndexNotifier.setIndex(i);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(
                        MaterialIcons.home_filled,
                        // color: Kolors.kPrimaryLight,
                        size: 34,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        AntDesign.piechart,
                        size: 26,
                      ),
                      label: 'Reports',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        MaterialCommunityIcons.chart_bar,
                        size: 26,
                      ),
                      label: 'Stocks',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        MaterialIcons.credit_card,
                        size: 26,
                      ),
                      label: 'Cards',
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
