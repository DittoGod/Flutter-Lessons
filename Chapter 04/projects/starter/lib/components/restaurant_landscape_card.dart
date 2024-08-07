import 'package:flutter/material.dart';

import '../models/restaurant.dart';

class RestaurantLandscapeCard extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantLandscapeCard({
    super.key,
    required this.restaurant,
  });

  @override
  State<RestaurantLandscapeCard> createState() =>
      _RestaurantLandscapeCardState();
}

class _RestaurantLandscapeCardState extends State<RestaurantLandscapeCard> {
  bool _isFavourited = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(8.0)),
            child: AspectRatio(
              aspectRatio: 2,
              // Stack widget overlays multiple elements. Here, it's used to
              // layer a favourite button over a restaurant's image, ensuring
              // you utilise the full space.
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // The restaurants image is displayed, with a scaling set to
                  // fill the entire container.
                  Image.asset(
                    widget.restaurant.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  // The IconButton is positioned at the top-right corner of the
                  // image, serving as the favourite action.
                  Positioned(
                    top: 4.0,
                    right: 4.0,
                    child: IconButton(
                      // The Icon displayed depends on the _isFavourite status.
                      // A filled heart represents a favourite, while an outline
                      // heart indicates otherwise.
                      icon: Icon(
                        _isFavourited ? Icons.favorite : Icons.favorite_border,
                      ),
                      iconSize: 30.0,
                      color: Colors.red[400],
                      // Tapping the favourite button toggles the _isFavourite
                      // state, effectively switching between the two heart
                      // icons. This is done via a call to setState().
                      onPressed: () {
                        setState(() {
                          _isFavourited = !_isFavourited;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              widget.restaurant.name,
              style: textTheme.titleSmall,
            ),
            subtitle: Text(
              widget.restaurant.attributes,
              maxLines: 1,
              style: textTheme.bodySmall,
            ),
            onTap: () {
              // ignore: avoid_print
              print('Tap on ${widget.restaurant.name}');
            },
          ),
        ],
      ),
    );
  }
}
