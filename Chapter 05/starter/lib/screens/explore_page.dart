import 'package:flutter/material.dart';
import 'package:yummy/api/mock_yummy_service.dart';

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
      builder: (context, AsyncSnapshot<ExploreData> snapshot){
        // If snapshot.connectionState is done, it means the data is available
        // to consume.
        if (snapshot.connectionState == ConnectionState.done){
          // Extract the data from snapshot.data, providing default values if
          // the data is null.
          final restaurants = snapshot.data?.restaurants ?? [];
          final categories = snapshot.data?.categories ?? [];
          final posts = snapshot.data?.friendPosts ?? [];

          //TODO: Replace this with Restaurant Section.
          return const Center(
            child: SizedBox(
              child: Text('Show RestaurantSection'),
            ),
          );
        } else {
          // if the data is not ready to consume, show loading spinner.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
