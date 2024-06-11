import 'package:bloc_test/bloc_test.dart';
import 'package:coffee_lover/pages/favorites/data/data.dart';
import 'package:coffee_lover/pages/favorites/domain/bloc/favorites_bloc.dart';
import 'package:coffee_lover/pages/home/domain/entities/coffee_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFavoritesRepository extends Mock implements FavoritesRepositoryI {}

void main() {
  late MockFavoritesRepository mockFavoritesRepository;
  late FavoritesBloc favoritesBloc;

  setUp(() {
    mockFavoritesRepository = MockFavoritesRepository();
    favoritesBloc = FavoritesBloc(services: mockFavoritesRepository);
  });

  tearDown(() {
    favoritesBloc.close();
  });

  group('FavoritesBloc', () {
    const coffeeEntity = CoffeeEntity(
      imageURL: 'https://coffee.alexflipnote.dev/random_coffee.png',
      isFavorite: true,
    );
    final favoritesList = [coffeeEntity];

    blocTest<FavoritesBloc, FavoritesState>(
      'emits [loading, success] when InitEvent is added and repository returns',
      build: () {
        when(() => mockFavoritesRepository.getFavorites()).thenAnswer(
          (_) async => favoritesList,
        );
        return favoritesBloc;
      },
      act: (bloc) => bloc.add(InitEvent()),
      expect: () => [
        FavoritesState.initial().copyWith(status: FavoritesStatus.loading),
        FavoritesState.initial().copyWith(
          status: FavoritesStatus.success,
          listFavorites: favoritesList,
        ),
      ],
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'emits [failure] when InitEvent is added and repository throws an error',
      build: () {
        when(() => mockFavoritesRepository.getFavorites())
            .thenThrow(Exception('Error'));
        return favoritesBloc;
      },
      act: (bloc) => bloc.add(InitEvent()),
      expect: () => [
        FavoritesState.initial().copyWith(status: FavoritesStatus.loading),
        FavoritesState.initial().copyWith(status: FavoritesStatus.failure),
      ],
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'emits [failure] when AddFavoriteEvent is added and repository fails',
      build: () {
        when(() => mockFavoritesRepository.getFavorites())
            .thenThrow(Exception('Error'));
        return favoritesBloc;
      },
      seed: FavoritesState.initial,
      act: (bloc) {
        when(() => mockFavoritesRepository.addFavorite(coffeeEntity))
            .thenThrow(Exception('Error'));
        bloc.add(const AddFavoriteEvent(coffeeEntity));
      },
      expect: () => [
        FavoritesState.initial().copyWith(status: FavoritesStatus.failure),
      ],
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'emits [failure] when RemoveFavoriteEvent is added and repository fails',
      build: () => favoritesBloc,
      seed: FavoritesState.initial,
      act: (bloc) {
        when(() => mockFavoritesRepository.removeFavorite(coffeeEntity))
            .thenThrow(Exception('Error'));
        bloc.add(const RemoveFavoriteEvent(coffeeEntity));
      },
      expect: () => [
        FavoritesState.initial().copyWith(status: FavoritesStatus.failure),
      ],
    );
  });
}
