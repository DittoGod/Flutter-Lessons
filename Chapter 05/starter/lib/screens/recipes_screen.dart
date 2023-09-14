import 'package:flutter/material.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';

class RecipesScreen extends StatelessWidget {
  // Create a mock service.
  final exploreService = MockFooderlichService();
  RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a FutureBuilder.
    return FutureBuilder(
      // Use getRecipes() to return the list of recipes to display. This
      // function returns a future list of SimpleRecipes.
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        // Check if the future is complete.
        if (snapshot.connectionState == ConnectionState.done) {
          // TODO: Add RecipesGridView Here
          // Add a placeholder text until you build RecipesGridView.
          return const Center(child: Text('Recipes Screen'));
        } else {
          // Show a circular loading indicator if the future isn’t complete yet.
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
