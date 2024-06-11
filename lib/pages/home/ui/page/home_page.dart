import 'package:coffee_lover/pages/home/data/repositories/coffee_repository.dart';
import 'package:coffee_lover/pages/home/domain/bloc/home_bloc.dart';
import 'package:coffee_lover/pages/home/ui/page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        repository: ICoffeeRepository(),
      )..add(InitEvent()),
      child: const HomeScreen(),
    );
  }
}
