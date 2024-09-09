import 'package:finany/src/reports/widgets/maindashboard.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Reportspage extends StatelessWidget {
  const Reportspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Maindashboard(),
      ),
    );
  }
}
