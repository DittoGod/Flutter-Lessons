import 'package:flutter/material.dart';
import '../models/models.dart';

class RecipeThumbnail extends StatelessWidget {
  // This class requires a SimpleRecipe as a parameter. That helps configure
  // your widget.
  final SimpleRecipe recipe;
  const RecipeThumbnail({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    // Create a Container with 8-point padding all around.
    return Container(
      padding: const EdgeInsets.all(8),
      // Use a Column to apply a vertical layout.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The first element of the column is Expanded, which widget holds on
          // to an Image. You want the image to fill the remaining space.
          Expanded(
            // The Image is within the ClipRRect, which clips the image to make
            // the borders rounded.
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                recipe.dishImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Add some room between the image and the other widgets.
          const SizedBox(height: 10),
          // Add the remaining Texts: one to display the recipe’s title and
          // another to display the duration.
          Text(
            recipe.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            recipe.duration,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
