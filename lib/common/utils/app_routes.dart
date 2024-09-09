import 'package:finany/src/entrypoint/views/entrypoint.dart';
import 'package:finany/src/onboarding/views/onboarding_page.dart';
import 'package:finany/src/reports/views/reportspage.dart';
import 'package:finany/src/reports/widgets/report_widget.dart';
import 'package:finany/src/splashscreen/views/splashscreen.dart';
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
