import 'dart:math' as math;

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:coffee_lover/pages/home/domain/bloc/home_bloc.dart';
import 'package:coffee_lover/pages/home/domain/entities/coffee_entity.dart';
import 'package:coffee_lover/pages/home/ui/widgets/coffee_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeCardStack extends StatelessWidget {
  const CoffeeCardStack({super.key});

  @override
  Widget build(BuildContext context) {
    final coffees = context.watch<HomeBloc>().state.coffees;
    final status = context.watch<HomeBloc>().state.status;

    return status.isLoading
        ? AppinioSwiper(
            cardCount: 3,
            backgroundCardScale: 1,
            backgroundCardOffset: const Offset(30, 0),
            onSwipeEnd: (previousIndex, targetIndex, activity) {
              if (targetIndex == coffees.length - 3) {
                context.read<HomeBloc>().add(const GetMoreCoffeeEvent());
              }
            },
            cardBuilder: (BuildContext context, int index) {
              final angle = index.isEven ? -math.pi / 30.0 : math.pi / 30.0;
              return Transform.rotate(
                angle: angle,
                child: const CoffeeCard(
                  coffee: CoffeeEntity.empty(),
                ),
              );
            },
          )
        : AppinioSwiper(
            cardCount: coffees.length,
            backgroundCardScale: 1,
            backgroundCardOffset: const Offset(30, 0),
            onSwipeEnd: (previousIndex, targetIndex, activity) {
              if (targetIndex == coffees.length - 3) {
                context.read<HomeBloc>().add(const GetMoreCoffeeEvent());
              }
            },
            cardBuilder: (BuildContext context, int index) {
              final angle = index.isEven ? -math.pi / 30.0 : math.pi / 30.0;
              return Transform.rotate(
                angle: angle,
                child: CoffeeCard(
                  coffee: coffees[index],
                ),
              );
            },
          );
  }
}
