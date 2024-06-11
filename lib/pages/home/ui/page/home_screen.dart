import 'package:coffee_lover/core/widgets/widgets.dart';
import 'package:coffee_lover/pages/home/domain/bloc/home_bloc.dart';
import 'package:coffee_lover/pages/home/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((HomeBloc bloc) => bloc.state.status);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          if (status == HomeStatus.failure)
            const Expanded(child: HomeFailureView())
          else
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text(
                      'Coffee Lover',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 50),
                    Flexible(
                      flex: 2,
                      child: Center(
                        child: CoffeeCardStack(),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          const AppBottomNav(),
        ],
      ),
    );
  }
}
