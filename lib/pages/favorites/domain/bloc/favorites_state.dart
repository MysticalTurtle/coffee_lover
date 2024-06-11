part of 'favorites_bloc.dart';

enum FavoritesStatus {
  initial(),
  loading(),
  success(),
  failure(),
  closeModal();

  bool get isInitial => this == FavoritesStatus.initial;
  bool get isLoading => this == FavoritesStatus.loading;
  bool get isSuccess => this == FavoritesStatus.success;
  bool get isFailure => this == FavoritesStatus.failure;
  bool get isCloseModal => this == FavoritesStatus.closeModal;
}

@immutable
class FavoritesState extends Equatable {
  const FavoritesState({
    this.status = FavoritesStatus.initial,
    this.listFavorites = const [],
  });

  factory FavoritesState.initial() => const FavoritesState();

  FavoritesState copyWith({
    FavoritesStatus? status,
    List<CoffeeEntity>? listFavorites,
  }) {
    return FavoritesState(
      status: status ?? this.status,
      listFavorites: listFavorites?? this.listFavorites,
    );
  }

  final FavoritesStatus status;
  final List<CoffeeEntity> listFavorites;

  @override
  List<Object> get props => [status, listFavorites];
}
