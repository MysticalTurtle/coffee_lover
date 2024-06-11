part of 'home_bloc.dart';

enum HomeStatus {
  initial(),
  loading(),
  success(),
  failure(),
  updating();

  bool get isInitial => this == HomeStatus.initial;
  bool get isLoading => this == HomeStatus.loading;
  bool get isSuccess => this == HomeStatus.success;
  bool get isFailure => this == HomeStatus.failure;
  bool get isUpdating => this == HomeStatus.updating;
}

class HomeState extends Equatable {
  const HomeState({
    required this.appError,
    this.status = HomeStatus.initial,
    this.coffees = const [],
  });

  HomeState.initial() : this(appError: AppError.empty());

  HomeState copyWith({
    AppError? appError,
    HomeStatus? status,
    List<CoffeeEntity>? coffees,
  }) =>
      HomeState(
        appError: appError ?? this.appError,
        status: status ?? this.status,
        coffees: coffees ?? this.coffees,
      );

  final AppError appError;
  final HomeStatus status;
  final List<CoffeeEntity> coffees;

  @override
  List<Object> get props => [appError, status, coffees];
}
