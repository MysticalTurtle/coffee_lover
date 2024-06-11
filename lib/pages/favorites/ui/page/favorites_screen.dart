import 'package:coffee_lover/core/widgets/app_bottom_nav.dart';
import 'package:coffee_lover/pages/favorites/domain/bloc/favorites_bloc.dart';
import 'package:coffee_lover/pages/favorites/ui/widgets/favorites_empty_view.dart';
import 'package:coffee_lover/pages/favorites/ui/widgets/favorites_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final coffeesLength =
        context.select((FavoritesBloc bloc) => bloc.state.listFavorites.length);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Favorites'),
            Text(
              '$coffeesLength images',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      body: const Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Expanded(
                    child: _FavoritesGridView(),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          AppBottomNav(selectedIndex: 1),
        ],
      ),
    );
  }
}

class _FavoritesGridView extends StatelessWidget {
  const _FavoritesGridView();

  @override
  Widget build(BuildContext context) {
    final coffees =
        context.select((FavoritesBloc bloc) => bloc.state.listFavorites);
    return coffees.isNotEmpty
        ? const FavoritesGrid()
        : const FavoritesEmptyView();
  }
}
