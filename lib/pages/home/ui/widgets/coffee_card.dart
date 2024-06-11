import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_lover/pages/home/domain/entities/coffee_entity.dart';
import 'package:coffee_lover/pages/home/ui/widgets/action_bar.dart';
import 'package:coffee_lover/pages/home/ui/widgets/loading_coffee.dart';
import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({required this.coffee, super.key});

  final CoffeeEntity coffee;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: 350,
        height: 350,
        child: coffee.imageURL.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: coffee.imageURL,
                imageBuilder: (_, imageProvider) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 5,
                            ),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      ActionBar(coffee: coffee),
                    ],
                  ),
                ),
                placeholder: (_, __) => const LoadingCoffee(),
              )
            : const LoadingCoffee(),
      ),
    );
  }
}
