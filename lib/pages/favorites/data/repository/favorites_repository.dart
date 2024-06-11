import 'dart:convert';

import 'package:coffee_lover/pages/home/domain/entities/coffee_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FavoritesRepository {
  Future<List<CoffeeEntity>> getFavorites();
  Future<void> addFavorite(CoffeeEntity coffeeEntity);
  Future<void> removeFavorite(CoffeeEntity coffeeEntity);
}

class FavoritesRepositoryI extends FavoritesRepository {
  @override
  Future<List<CoffeeEntity>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = <CoffeeEntity>[];
    final favoritesRaw = prefs.getStringList('favorites') ?? [];

    for (final favoriteRaw in favoritesRaw) {
      final favorite = CoffeeEntity.fromJson(
        jsonDecode(favoriteRaw) as Map<String, dynamic>,
      );
      favorites.add(favorite);
    }

    // get from internal storage
    return Future.value(favorites);
  }

  @override
  Future<void> addFavorite(CoffeeEntity coffeeEntity) async {
    // add to internal storage
    final prefs = await SharedPreferences.getInstance();
    final favoritesRaw = prefs.getStringList('favorites') ?? []
      ..add(jsonEncode(coffeeEntity.toJson()));
    await prefs.setStringList('favorites', favoritesRaw);
  }

  @override
  Future<void> removeFavorite(CoffeeEntity coffeeEntity) async {
    // remove from internal storage
    final prefs = await SharedPreferences.getInstance();
    final favoritesRaw = prefs.getStringList('favorites') ?? [];

    for (final favoriteRaw in favoritesRaw) {
      final favorite = CoffeeEntity.fromJson(
        jsonDecode(favoriteRaw) as Map<String, dynamic>,
      );
      if (favorite.imageURL == coffeeEntity.imageURL) {
        favoritesRaw.remove(favoriteRaw);
        break;
      }
    }

    await prefs.setStringList('favorites', favoritesRaw);
  }
}
