import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeFailureView extends StatelessWidget {
  const HomeFailureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset('assets/lottie/error.json'),
        ),
        const Text(
          'Something went wrong!',
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
