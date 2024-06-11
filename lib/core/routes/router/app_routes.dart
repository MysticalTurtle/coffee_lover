enum AppRoutes {
  home,
  favorites,
  error,
}

extension AppPageExtension on AppRoutes {
  String get toPath {
    return switch (this) {
      AppRoutes.home => '/home',
      AppRoutes.favorites => '/favorites',
      AppRoutes.error => '/error',
    };
  }

  String get toName {
    return switch (this) {
      AppRoutes.home => 'HOME',
      AppRoutes.favorites => 'FAVORITES',
      AppRoutes.error => 'ERROR',
    };
  }
}
