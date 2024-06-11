import 'package:coffee_lover/core/routes/routes.dart';
import 'package:coffee_lover/l10n/l10n.dart';
import 'package:coffee_lover/pages/favorites/data/repository/favorites_repository.dart';
import 'package:coffee_lover/pages/favorites/domain/bloc/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesBloc(
        services: FavoritesRepositoryI(),
      )..add(InitEvent()),
      child: MaterialApp.router(
        routerConfig: goRouter,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
