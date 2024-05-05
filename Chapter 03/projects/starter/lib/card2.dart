import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'author_card.dart';

class Card2 extends StatelessWidget {
  const Card2({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      // The Center widget has a Container child widget which has three
      // properties, the first two being constraints and decoration.
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mag5.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        // The third property is child and it has a Column widget, which
        // displays its children vertically.
        child: Column(
          children: [
            const AuthorCard(
              authorName: 'Mike Katz',
              title: 'Smoothie Connoisseur',
              imageProvider: AssetImage('assets/author_katz.jpeg'),
            ),
            // With Expanded, you fill in the remaining available space.
            Expanded(
              // Apply a Stack widget to position the texts on top of each
              // other.
              child: Stack(
                children: [
                  // Position the first text 16 pixels from the bottom and 16
                  // pixels from the right.
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Text(
                      'Recipe',
                      style: FooderlichTheme.lightTextTheme.displayLarge,
                    ),
                  ),
                  // Finally, position the second text 70 pixels from the bottom
                  // and 16 pixels from the left. Also apply a RotatedBox
                  // widget, which rotates the text clockwise three
                  // quarterTurns. This makes it appear vertical.
                  Positioned(
                    bottom: 70,
                    left: 16,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'Smoothies',
                        style: FooderlichTheme.lightTextTheme.displayLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
