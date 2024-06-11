import 'package:coffee_lover/core/routes/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key, this.selectedIndex = 0});
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          context.goNamed(AppRoutes.home.toName);
        } else {
          context.goNamed(AppRoutes.favorites.toName);
        }
      },
    );
  }
}
