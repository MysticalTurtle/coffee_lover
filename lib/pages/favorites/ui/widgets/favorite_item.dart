import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_lover/pages/favorites/domain/bloc/favorites_bloc.dart';
import 'package:coffee_lover/pages/home/domain/entities/coffee_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    required this.coffee,
    super.key,
  });

  final CoffeeEntity coffee;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: coffee.imageURL,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              showDialog<Widget>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Remove Favorite'),
                    content: const Text(
                      'Are you sure you want to remove this favorite?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          context.read<FavoritesBloc>().add(
                            RemoveFavoriteEvent(coffee),
                          );
                        },
                        child: const Text('Remove'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.red.shade700,
              size: 30,
              shadows: const [
                BoxShadow(
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
