import 'package:flutter/material.dart';
import 'package:yummy/models/restaurant.dart';

class RestaurantLandscapeCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantLandscapeCard({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply(
          displayColor: Theme.of(context).colorScheme.onSurface,
        );

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // TODO: Add Image
          // TODO: Add ListTile
        ],
      ),
    );
  }
}
