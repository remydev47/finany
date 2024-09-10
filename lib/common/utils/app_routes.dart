import 'package:finany/src/entrypoint/views/entrypoint.dart';
import 'package:finany/src/onboarding/views/onboarding_page.dart';
import 'package:finany/src/reports/views/reportspage.dart';
import 'package:finany/src/reports/widgets/report_widget.dart';
import 'package:finany/src/splashscreen/views/splashscreen.dart';
import 'package:finany/src/stocks/pages/stock_details.dart';
import 'package:finany/src/stocks/pages/stck_invest.dart';
import 'package:finany/src/stocks/views/stockpage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Splashscreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => Entrypoint(),
    ),
    GoRoute(
      path: '/stockinvest',
      builder: (context, state) => StockInvest(),
    ),
    GoRoute(
      path: '/stock/:symbol',
      builder: (context, state) {
        final symbol = state.pathParameters['symbol']!;
        final extra = state.extra as Map<String, dynamic>;
        return StockDetailsPage(
          symbol: symbol,
          name: extra['name'] as String,
          price: extra['price'] as double,
          change: extra['change'] as double,
          changePercentage: extra['changePercentage'] as double,
        );
      },
    ),
    GoRoute(
      path: '/stockpage',
      builder: (context, state) => Stockpage(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: '/reportwidget',
      builder: (context, state) => const ReportWidget(),
    ),
    GoRoute(
      path: '/report',
      builder: (context, state) => const Reportspage(),
    ),
  ],
);

GoRouter get router => _router;
