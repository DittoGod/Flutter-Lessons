import 'package:flutter/material.dart';
// Import the barrel files, component.dart and models.dart, so you can use data
// models and UI components.
import '../components/components.dart';
import '../models/models.dart';

class TodayRecipeListView extends StatelessWidget {
  // TodayRecipeListView needs a list of recipes to display.
  final List<ExploreRecipe> recipes;
  const TodayRecipeListView({
    super.key,
    required this.recipes,
  });
  @override
  Widget build(BuildContext context) {
    // Within build(), start by applying some padding.
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      // Add a Column to place widgets in a vertical layout.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // In the column, add a Text. This is the header for the Recipes of
          // the Day.
          Text('Recipes of the Day',
              style: Theme.of(context).textTheme.displayLarge),
          // Add a 16-point-tall SizedBox, to supply some padding.
          const SizedBox(height: 16),
          // Add a Container, 400 points tall, and set the background color to
          // grey. This container will hold your horizontal list view.
          Container(
            height: 400,
            // Change the color from grey to transparent.
            color: Colors.transparent,
            // Create ListView.separated. Remember, this widget creates two
            // IndexedWidgetBuilders.
            child: ListView.separated(
              // Set the scroll direction to the horizontal axis.
              scrollDirection: Axis.horizontal,
              // Set the number of items in the list view.
              itemCount: recipes.length,
              // Create the itemBuilder callback, which will go through every
              // item in the list.
              itemBuilder: (context, index) {
                // Get the recipe for the current index and build the card.
                final recipe = recipes[index];
                return buildCard(recipe);
              },
              // Create the separatorBuilder callback, which will go through
              // every item in the list.
              separatorBuilder: (context, index) {
                // For every item, you create a SizedBox to space every item 16
                // points apart.
                return const SizedBox(width: 16);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception('This card doesn\'t exist yet');
    }
  }
}
