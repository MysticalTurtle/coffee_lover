import 'package:bloc_test/bloc_test.dart';
import 'package:coffee_lover/core/error/app_error.dart';
import 'package:coffee_lover/pages/home/data/model/coffee_model.dart';
import 'package:coffee_lover/pages/home/data/repositories/coffee_repository.dart';
import 'package:coffee_lover/pages/home/domain/bloc/home_bloc.dart';
import 'package:coffee_lover/pages/home/domain/entities/coffee_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


class MockCoffeeRepository extends Mock implements CoffeeRepository {}
class FakeCoffeeModel extends Fake implements CoffeeModel {}
class FakeAppError extends Fake implements AppError {}

void main() {
  late MockCoffeeRepository mockCoffeeRepository;
  late HomeBloc homeBloc;

  setUpAll(() {
    registerFallbackValue(FakeCoffeeModel());
    registerFallbackValue(FakeAppError());
  });

  setUp(() {
    mockCoffeeRepository = MockCoffeeRepository();
    homeBloc = HomeBloc(repository: mockCoffeeRepository);
  });

  tearDown(() {
    homeBloc.close();
  });

  group('HomeBloc', () {
    const coffeeModel =
        CoffeeModel(file: 'https://coffee.alexflipnote.dev/random_coffee.png');
    const coffeeEntity = CoffeeEntity(
      imageURL: 'https://coffee.alexflipnote.dev/random_coffee.png',
      isFavorite: false,
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, success] when InitEvent is added and repository returns',
      build: () {
        when(() => mockCoffeeRepository.getCoffee()).thenAnswer(
          (_) async => (coffeeModel, null),
        );
        return homeBloc;
      },
      act: (bloc) => bloc.add(InitEvent()),
      expect: () => [
        HomeState.initial().copyWith(status: HomeStatus.loading),
        HomeState.initial().copyWith(
          status: HomeStatus.success,
          coffees: List.generate(5, (index) => coffeeEntity),
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, failure] when InitEvent is added and repository fails',
      build: () {
        when(() => mockCoffeeRepository.getCoffee()).thenAnswer(
          (_) async => (
            null,
            const AppError(
              title: 'Error',
              message: 'Service not available at the moment',
              statuCode: 500,
            )
          ),
        );
        return homeBloc;
      },
      act: (bloc) => bloc.add(InitEvent()),
      expect: () => [
        HomeState.initial().copyWith(status: HomeStatus.loading),
        HomeState.initial().copyWith(
          status: HomeStatus.failure,
          appError: const AppError(
            title: 'Error',
            message: 'Service not available at the moment',
            statuCode: 500,
          ),
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [updating, success] when GetMoreCoffeeEventis added and returns',
      build: () {
        when(() => mockCoffeeRepository.getCoffee()).thenAnswer(
          (_) async => (coffeeModel, null),
        );
        return homeBloc;
      },
      seed: () => HomeState.initial().copyWith(
        status: HomeStatus.success,
        coffees: [coffeeEntity],
      ),
      act: (bloc) => bloc.add(const GetMoreCoffeeEvent(coffeeNumber: 2)),
      expect: () => [
        HomeState.initial().copyWith(
          status: HomeStatus.updating,
          coffees: [coffeeEntity],
        ),
        HomeState.initial().copyWith(
          status: HomeStatus.success,
          coffees: [coffeeEntity, coffeeEntity, coffeeEntity],
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits updated state when MarkFavoriteEvent is added',
      build: () => homeBloc,
      seed: () => HomeState.initial().copyWith(
        status: HomeStatus.success,
        coffees: [coffeeEntity],
      ),
      act: (bloc) => bloc.add(const MarkFavoriteEvent(coffeeEntity)),
      expect: () => [
        HomeState.initial().copyWith(
          status: HomeStatus.success,
          coffees: [coffeeEntity.copyWith(isFavorite: true)],
        ),
      ],
    );
  });
}
