import 'package:flutter/material.dart';

// Import restaurant component and model.
import 'package:yummy/components/restaurant_landscape_card.dart';
import 'package:yummy/models/restaurant.dart';

class RestaurantSection extends StatelessWidget {
  // RestaurantSection is a statelessWidget that requires a list of restaurants.
  final List<Restaurant> restaurants;

  const RestaurantSection({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    // Within build(), start by applying some padding.
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // Add a column to place widgets in a vertical layout.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            // In the column, add a Text. This is the header for the 'Food near
            // me' section.
            child: Text(
              'Food near me',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // TODO: Add restaurant List View.
          // Add a container, 400 pixels tall, and set the background color to
          // grey. This container is a placeholder for the ListView of
          // restaurants.
          Container(
            height: 400,
            // TODO: Add ListView here
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
