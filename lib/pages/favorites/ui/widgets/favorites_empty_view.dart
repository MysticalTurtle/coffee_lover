import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FavoritesEmptyView extends StatelessWidget {
  const FavoritesEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/lottie/empty.json'),
        const SizedBox(height: 20),
        const Text(
          'No favorites yet!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
