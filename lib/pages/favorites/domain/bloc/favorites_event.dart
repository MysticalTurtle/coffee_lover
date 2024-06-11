part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();
}

class InitEvent extends FavoritesEvent {
  @override
  List<Object> get props => [];
}

class AddFavoriteEvent extends FavoritesEvent {
  const AddFavoriteEvent(this.coffeeEntity);

  final CoffeeEntity coffeeEntity;

  @override
  List<Object> get props => [coffeeEntity];
}

class RemoveFavoriteEvent extends FavoritesEvent {
  const RemoveFavoriteEvent(this.coffeeEntity);

  final CoffeeEntity coffeeEntity;

  @override
  List<Object> get props => [coffeeEntity];
}
