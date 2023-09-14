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
    // This is the FutureBuilder from before. It runs an asynchronous task and
    // lets you know the state of the future.
    return FutureBuilder(
      // Use your mock service to call getExploreData(). This returns an
      // ExploreData object future.
      future: mockService.getExploreData(),
      // Check the state of the future within the builder callback.
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // Check if the future is complete.
        if (snapshot.connectionState == ConnectionState.done) {
          // When the future is complete, return the primary ListView. This
          // holds an explicit list of children. In this scenario, the primary
          // ListView will hold the other two ListViews as children.
          return ListView(
            // Set the scroll direction to vertical, although that’s the default
            // value.
            scrollDirection: Axis.vertical,
            children: [
              // The first item in children is TodayRecipeListView. You pass in
              // the list of todayRecipes from ExploreData.
              TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
              // Add a 16-point vertical space so the lists aren’t too close to
              // each other.
              const SizedBox(height: 16),
              // Add a green placeholder container. You’ll create and add the
              // FriendPostListView later.
              // TODO: Replace this with FriendPostListView
              Container(
                height: 400,
                color: Colors.green,
              ),
            ],
          );
        } else {
          // If the future hasn’t finished loading yet, show a circular progress
          // indicator.
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
