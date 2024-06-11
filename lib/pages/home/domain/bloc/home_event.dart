part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class InitEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class GetMoreCoffeeEvent extends HomeEvent {
  const GetMoreCoffeeEvent({this.coffeeNumber = 5});

  final int coffeeNumber;

  @override
  List<Object> get props => [coffeeNumber];
}

class MarkFavoriteEvent extends HomeEvent {
  const MarkFavoriteEvent(this.coffee);

  final CoffeeEntity coffee;

  @override
  List<Object> get props => [coffee];
}
