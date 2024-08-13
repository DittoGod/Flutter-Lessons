// Import necessary packages and classes.
import 'package:flutter/material.dart';
import 'package:yummy/models/restaurant.dart';

// Define a new StatefulWidget so it has a mutable state.
class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;

  // RestaurantPage takes in a restaurant object which contains data such as
  // restaurant info and menu to display on the page.
  const RestaurantPage({super.key, required this.restaurant});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

// _RestaurantPageState is a class that holds the state for RestaurantPage.
class _RestaurantPageState extends State<RestaurantPage> {
  // TODO: Add Desktop Threshold.
  // TODO: Add Constraint properties.
  // TODO: Calculate Constraint width.
  // TODO: Add Calculate Column Count.

  // TODO: Build Custom ScrollView.
  // TODO: Build Sliver AppBar.
  // TODO: Build InfoSection.
  // TODO: Build Grid Item.
  // TODO: Build Section Title.
  // TODO: Build GridView.
  // TODO: Build GridView Section.

  // TODO: Replace build method.
  @override
  Widget build(BuildContext context) {
    // PlaceHolder Text.
    return Scaffold(
      body: Center(
        // TODO: Replace with CustomScrollView.
        child: Text('Restaurant Page', style: TextStyle(fontSize: 16.0)),
      ),
    );
  }
}
