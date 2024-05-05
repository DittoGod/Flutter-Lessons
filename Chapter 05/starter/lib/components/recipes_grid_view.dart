import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';

class RecipesGridView extends StatelessWidget {
  // RecipesGridView requires a list of recipes to display in a grid.
  final List<SimpleRecipe> recipes;
  const RecipesGridView({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    // Apply a 16 point padding on the left, right, and top.
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      // Create a GridView.builder, which displays only the items visible
      // onscreen.
      child: GridView.builder(
        // Tell the grid view how many items will be in the grid.
        itemCount: recipes.length,
        // Add SliverGridDelegateWithFixedCrossAxisCount and set the
        // crossAxisCount to 2. That means that there will be only two columns.
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          // For every index, fetch the recipe and create a corresponding
          // RecipeThumbnail.
          final simpleRecipe = recipes[index];
          return RecipeThumbnail(recipe: simpleRecipe);
        },
      ),
    );
  }
}
