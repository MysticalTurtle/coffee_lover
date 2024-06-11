import 'package:coffee_lover/pages/home/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppScreenLoading extends StatelessWidget {
  const AppScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoadingCoffee(),
      ),
    );
  }
}
