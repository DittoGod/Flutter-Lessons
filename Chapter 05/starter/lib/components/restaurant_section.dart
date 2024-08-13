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
          // The ListView will have a fixed height of 230 pixels. It acts as a
          // container to constrain the height of the child.
          SizedBox(
            height: 230,
            // ListView.builder widget dynamically creates a list of items based
            // on the provided data.
            child: ListView.builder(
              // Configure the items in the ListView to scroll horizontally.
              scrollDirection: Axis.horizontal,
              // Set the itemCount to be the length of restaurants list. This
              // determines how many items the list should render.
              itemCount: restaurants.length,
              // itemBuilder is a function that returns a widget for a given
              // index od the list. It's invoked for each item in the restaurant
              // list.
              itemBuilder: (context, index) {
                // Set a fixed width of 300 pixels for every restaurant card.
                return SizedBox(
                  width: 300,
                  // Create a RestaurantLandScapeCard widget and pass in the
                  // restaurant object based on the current index.
                  child: RestaurantLandscapeCard(
                    restaurant: restaurants[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
