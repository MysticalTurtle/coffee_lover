import 'package:coffee_lover/pages/favorites/domain/bloc/favorites_bloc.dart';
import 'package:coffee_lover/pages/home/domain/bloc/home_bloc.dart';
import 'package:coffee_lover/pages/home/domain/entities/coffee_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteActionButton extends StatelessWidget {
  const FavoriteActionButton({required this.coffee, super.key});

  final CoffeeEntity coffee;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        color: coffee.isFavorite ? Colors.red : Colors.grey,
        size: 30,
      ),
      onPressed: () {
        context.read<HomeBloc>().add(MarkFavoriteEvent(coffee));
        if (coffee.isFavorite) {
          context.read<FavoritesBloc>().add(RemoveFavoriteEvent(coffee));
        } else {
          context.read<FavoritesBloc>().add(AddFavoriteEvent(coffee));
        }
      },
    );
  }
}
