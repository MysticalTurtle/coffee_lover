import 'package:coffee_lover/pages/favorites/domain/bloc/favorites_bloc.dart';
import 'package:coffee_lover/pages/favorites/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesGrid extends StatelessWidget {
  const FavoritesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final coffees =
        context.select((FavoritesBloc bloc) => bloc.state.listFavorites);
    return GridView.builder(
      itemCount: coffees.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return FavoriteItem(
          coffee: coffees[index],
        );
      },
    );
  }
}
