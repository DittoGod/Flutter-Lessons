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
    final TextTheme textTheme = Theme.of(context).textTheme.apply(
          displayColor: Theme.of(context).colorScheme.onSurface,
        );

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            // borderRadius rounds the top corners with an 8.0 unit radius.
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
            // AspectRatio displays an image with a 2:1 width-to-height ratio.
            // The image scales to fit its container.
            child: AspectRatio(
              aspectRatio: 2,
              child: Image.asset(restaurant.imageUrl, fit: BoxFit.cover),
            ),
          ),
          ListTile(
            // title shows the restaurants name with a specific style.
            title: Text(restaurant.name, style: textTheme.titleSmall),
            // subtitle displays the restaurants attributes, truncated if more
            // than one line.
            subtitle: Text(restaurant.attributes, style: textTheme.bodySmall),
            // onTap prints the restaurant's name to the console when tapped.
            onTap: () {
              // ignore: avoid_print
              print('Tap on ${restaurant.name}');
            },
          ),
        ],
      ),
    );
  }
}
