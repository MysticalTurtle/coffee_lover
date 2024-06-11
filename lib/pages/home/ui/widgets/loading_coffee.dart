import 'package:flutter/material.dart';

class LoadingCoffee extends StatelessWidget {
  const LoadingCoffee({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: Image.asset(
          'assets/images/coffee_loading.gif',
          fit: BoxFit.cover,
          width: 350,
          height: 350,
        ),
      ),
    );
  }
}
