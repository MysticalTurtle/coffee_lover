import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coffee_lover/core/error/app_error.dart';
import 'package:coffee_lover/pages/home/data/repositories/coffee_repository.dart';
import 'package:coffee_lover/pages/home/domain/entities/coffee_entity.dart';
import 'package:coffee_lover/pages/home/domain/mapper/coffee_mapper.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

typedef HomeStateEmitter = Emitter<HomeState>;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required CoffeeRepository repository,
  })  : _repository = repository,
        super(HomeState.initial()) {
    on<InitEvent>(_onInitEvent);
    on<GetMoreCoffeeEvent>(_onGetMoreCoffeeEvent);
    on<MarkFavoriteEvent>(_onMarkFavoriteEvent);
  }

  final CoffeeRepository _repository;
  final CoffeeMapper _mapper = CoffeeMapper();

  FutureOr<void> _onInitEvent(
    InitEvent ev,
    HomeStateEmitter emit,
  ) async {
    emit(
      state.copyWith(
        status: HomeStatus.loading,
      ),
    );

    final coffees = <CoffeeEntity>[];
    var atLeastOneSuccess = false;

    // Get 3 coffees
    const coffeeNumber = 5;

    for (var i = 0; i < coffeeNumber; i++) {
      final (response, _) = await _repository.getCoffee();
      if (response != null) {
        atLeastOneSuccess = true;
        coffees.add(
          _mapper.fromModel(
            response,
          ),
        );
      } else {
        coffees.add(
          const CoffeeEntity.empty(),
        );
      }
    }

    if (atLeastOneSuccess) {
      emit(
        state.copyWith(
          status: HomeStatus.success,
          coffees: coffees,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          appError: const AppError(
            title: 'Error',
            message: 'Service not available at the moment',
            statuCode: 500,
          ),
        ),
      );
    }
  }

  FutureOr<void> _onGetMoreCoffeeEvent(
    GetMoreCoffeeEvent event,
    HomeStateEmitter emit,
  ) async {
    emit(
      state.copyWith(
        status: HomeStatus.updating,
      ),
    );

    final coffees = <CoffeeEntity>[];

    for (var i = 0; i < event.coffeeNumber; i++) {
      final (response, _) = await _repository.getCoffee();
      if (response != null) {
        coffees.add(
          _mapper.fromModel(
            response,
          ),
        );
      } else {
        coffees.add(
          const CoffeeEntity.empty(),
        );
      }
    }

    emit(
      state.copyWith(
        status: HomeStatus.success,
        coffees: List<CoffeeEntity>.from(state.coffees)..addAll(coffees),
      ),
    );
  }

  FutureOr<void> _onMarkFavoriteEvent(
    MarkFavoriteEvent event,
    HomeStateEmitter emit,
  ) async {
    final coffees = List<CoffeeEntity>.from(state.coffees);
    final index = coffees.indexWhere(
      (element) => element.imageURL == event.coffee.imageURL,
    );

    if (index != -1) {
      final coffee = coffees[index].copyWith(
        isFavorite: !coffees[index].isFavorite,
      );

      coffees[index] = coffee;

      emit(
        state.copyWith(
          status: HomeStatus.success,
          coffees: coffees,
        ),
      );
    }
  }
}
