import 'package:coffee_lover/core/routes/router/app_routes.dart';
import 'package:coffee_lover/core/routes/routing.dart';
import 'package:coffee_lover/core/widgets/app_screen_failure.dart';
import 'package:coffee_lover/pages/favorites/ui/page/favorites_page.dart';
import 'package:coffee_lover/pages/home/ui/page/home_page.dart';
import 'package:go_router/go_router.dart';


final GoRouter goRouter = GoRouter(
  // observers: [UIToast.toastObserver],
  initialLocation: AppRoutes.home.toPath,
  routes: <GoRoute>[
    GoRoute(
      path: AppRoutes.home.toPath,
      name: AppRoutes.home.toName,
      pageBuilder: (context, state) {
        return FadePageRoute(
          key: state.pageKey,
          newPage: const HomePage(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.favorites.toPath,
      name: AppRoutes.favorites.toName,
      pageBuilder: (context, state) {
        return FadePageRoute(
          key: state.pageKey,
          newPage: const FavoritesPage(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.error.toPath,
      name: AppRoutes.error.toName,
      pageBuilder: (context, state) {
        return FadePageRoute(
          key: state.pageKey,
          newPage: const AppScreenFailure(),
        );
      },
    ),
  ],
  errorBuilder: (context, state) => const AppScreenFailure(),
);
