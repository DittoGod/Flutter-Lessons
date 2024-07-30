import 'package:flutter/material.dart';
import 'package:yummy/models/food_category.dart';

class CategoryCard extends StatelessWidget {
  // It simply takes in a FoodCategory object, which you'll use later to display
  // data in the UI.
  final FoodCategory category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply(
          displayColor: Theme.of(context).colorScheme.onSurface,
        );

    // 1
    return Card(
      // 2
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              // Add a ClipRRect widget, which clips the image with rounded
              // corners at the top.
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8.0),
                ),
                child: Image.asset(category.imageUrl),
              ),
              // Position the text "Yummy" on the top-left.
              Positioned(
                left: 16.0,
                top: 16.0,
                child: Text(
                  'Yummy',
                  style: textTheme.headlineLarge,
                ),
              ),
              // Rotate the text "Smoothies" 90 degrees and place it at the
              // bottom-right.
              Positioned(
                bottom: 16.0,
                right: 16.0,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    'Smoothies',
                    style: textTheme.headlineLarge,
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            // Display the category name with a smaller title style.
            title: Text(
              category.name,
              style: textTheme.titleSmall,
            ),
            // Display the number of restaurants in a small body text style.
            subtitle: Text(
              '${category.numberOfRestaurants} places',
              style: textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
