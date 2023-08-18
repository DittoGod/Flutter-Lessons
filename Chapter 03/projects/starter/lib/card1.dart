import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key});
  // Define string variables to display on the card. This is just sample data
  // to help build the card.
  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';

  // Every stateless widget comes with a build() method that you override.
  @override
  Widget build(BuildContext context) {
    // Start with a Container laid out in the center.
    return Center(
      // TODO: Card1 Decorate Container
      child: Container(),
    );
  }
}
