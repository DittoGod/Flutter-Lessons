import 'package:flutter/material.dart';
import 'package:yummy/api/mock_yummy_service.dart';
import 'package:yummy/components/category_section.dart';
import 'package:yummy/components/post_section.dart';
import 'package:yummy/components/restaurant_section.dart';

class ExplorePage extends StatelessWidget {
  // Create a MockYummyService, to mock server responses
  final mockService = MockYummyService();

  ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // FutureBuilder is a widget that works with asynchronous operations,
    // allowing you to build UI based on the latest snapshots of a Future.
    return FutureBuilder(
      // FutureBuilder takes a future. Using getExploreData() to fetch data,
      // which returns an instance of ExploreData.
      future: mockService.getExploreData(),
      // builder() is a function that decides what the UI should look like based
      // on the current state of Future. Which is provided by the snapshot.
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // If snapshot.connectionState is done, it means the data is available
        // to consume.
        if (snapshot.connectionState == ConnectionState.done) {
          // Extract the data from snapshot.data, providing default values if
          // the data is null.
          final restaurants = snapshot.data?.restaurants ?? [];
          final categories = snapshot.data?.categories ?? [];
          final posts = snapshot.data?.friendPosts ?? [];

          // Initialize a scrollable list of widgets.
          return ListView(
            // shrinkWrap sizes the ListView based on its children's height.
            shrinkWrap: true,
            // The list scrolls vertically.
            scrollDirection: Axis.vertical,
            // The list contains three child list view widgets.
            children: [
              RestaurantSection(restaurants: restaurants),
              CategorySection(categories: categories),
              PostSection(posts: posts),
            ],
          );
        } else {
          // If the data is not ready to consume, show loading spinner.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
