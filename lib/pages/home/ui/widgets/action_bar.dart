import 'package:coffee_lover/pages/favorites/ui/widgets/favorite_action_button.dart';
import 'package:coffee_lover/pages/home/domain/entities/coffee_entity.dart';
import 'package:flutter/material.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({required this.coffee, super.key});

  final CoffeeEntity coffee;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FavoriteActionButton(coffee: coffee),
        ],
      ),
    );
  }
}
