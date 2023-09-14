import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  // Create a MockFooderlichService, to mock server responses.
  final mockService = MockFooderlichService();
  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Display a placeholder text. You’ll replace this later.
    // Within the widget’s build(), you create a FutureBuilder.
    return FutureBuilder(
      // The FutureBuilder takes in a Future as a parameter. getExploreData()
      // creates a future that will, in turn, return an ExploreData instance.
      // That instance will contain two lists, todayRecipes and friendPosts.
      future: mockService.getExploreData(),
      // Within builder, you use snapshot to check the current state of the
      // Future.
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // Now, the Future is complete and you can extract the data to pass to
        // your widget.
        if (snapshot.connectionState == ConnectionState.done) {
          // snapshot.data returns ExploreData, from which you extract
          // todayRecipes to pass to the list view. Right now, you show a simple
          // text as a placeholder. You’ll build a TodayRecipeListView soon.
          final recipes = snapshot.data?.todayRecipes ?? [];
          // TODO: Replace this with TodayRecipeListView
          return Center(
            child: Container(
              child: const Text('Show TodayRecipeListView'),
            ),
          );
        } else {
          // The future is still loading, so you show a spinner to let the user
          // know something is happening.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
