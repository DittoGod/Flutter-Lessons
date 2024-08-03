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
              // TODO: Convert to a stack
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // 2
                  Image.asset(
                    widget.restaurant.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  // 3
                  Positioned(
                    top: 4.0,
                    right: 4.0,
                    child: IconButton(
                      // 4
                      icon: Icon(
                        _isFavourited ? Icons.favorite : Icons.favorite_border,
                      ),
                      iconSize: 30.0,
                      color: Colors.red[400],
                      // 5
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
