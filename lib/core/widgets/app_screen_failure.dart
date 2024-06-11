import 'package:flutter/material.dart';

class AppScreenFailure extends StatelessWidget {
  const AppScreenFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Something went wrong!'),
      ),
    );
  }
}
