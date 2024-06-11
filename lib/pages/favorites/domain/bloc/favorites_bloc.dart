import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coffee_lover/pages/favorites/data/data.dart';
import 'package:coffee_lover/pages/home/domain/entities/coffee_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

typedef FavoritesStateEmitter = Emitter<FavoritesState>;

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({
    required FavoritesRepository services,
  })  : repository = services,
        super(FavoritesState.initial()) {
    on<InitEvent>(_onInitEvent);
    on<AddFavoriteEvent>(_onAddFavoriteEvent);
    on<RemoveFavoriteEvent>(_onRemoveFavoriteEvent);
  }

  final FavoritesRepository repository;

  FutureOr<void> _onInitEvent(
    InitEvent event,
    FavoritesStateEmitter emit,
  ) async {
    emit(
      state.copyWith(
        status: FavoritesStatus.loading,
      ),
    );

    try {
      final favorites = await repository.getFavorites();
      emit(
        state.copyWith(
          status: FavoritesStatus.success,
          listFavorites: favorites,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: FavoritesStatus.failure,
        ),
      );
    }
  }

  FutureOr<void> _onAddFavoriteEvent(
    AddFavoriteEvent event,
    FavoritesStateEmitter emit,
  ) async {
    try {
      await repository.addFavorite(event.coffeeEntity);
      emit(
        state.copyWith(
          status: FavoritesStatus.success,
          listFavorites: [...state.listFavorites, event.coffeeEntity],
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: FavoritesStatus.failure,
        ),
      );
    }
  }

  FutureOr<void> _onRemoveFavoriteEvent(
    RemoveFavoriteEvent event,
    FavoritesStateEmitter emit,
  ) async {
    try {
      await repository.removeFavorite(event.coffeeEntity);
      final updatedList = state.listFavorites
          .where((element) => element.imageURL != event.coffeeEntity.imageURL)
          .toList();
      emit(
        state.copyWith(
          status: FavoritesStatus.success,
          listFavorites: updatedList,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: FavoritesStatus.failure,
        ),
      );
    }
  }
}
