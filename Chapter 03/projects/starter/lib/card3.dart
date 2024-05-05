import 'dart:developer';
import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';

class Card3 extends StatelessWidget {
  const Card3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mag2.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                // You add a container with a color overlay with a 60%
                // semi-transparent background to make the image appear darker.
                color: Colors.black.withOpacity(0.6),
                // This gives the appearance of rounded image corners.
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            Container(
              // Apply padding of 16 pixels on all sides.
              padding: const EdgeInsets.all(16),
              // Set up a child Column to lay out the widgets vertically.
              child: Column(
                // Position all the widgets to the left of the column.
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Add a book icon.
                  const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 40,
                  ),
                  // Apply an 8-pixel space vertically.
                  const SizedBox(height: 8),
                  // Add the text widget.
                  Text(
                    'Recipe Trends',
                    style: FooderlichTheme.darkTextTheme.displayMedium,
                  ),
                  // Apply a 30-pixel space vertically.
                  const SizedBox(height: 30),
                ],
              ),
            ),
            // You add a Center widget.
            Center(
              // Wrap is a layout widget that attempts to lay out each of its
              // children adjacent to the previous children. If there’s not
              // enough space, it wraps to the next line.
              child: Wrap(
                // Place the children as close to the left, i.e. the start, as
                // possible.
                alignment: WrapAlignment.start,
                // Apply a 12-pixel space between each child in the main axis.
                spacing: 12,
                // Apply a 12-pixel space between each child in the cross axis.
                runSpacing: 12,
                // Add the list of Chip widgets.
                children: [
                  Chip(
                    label: Text('Healthy',
                        style: FooderlichTheme.darkTextTheme.bodyLarge),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('delete');
                    },
                  ),
                  Chip(
                    label: Text('Vegan',
                        style: FooderlichTheme.darkTextTheme.bodyLarge),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('delete');
                    },
                  ),
                  Chip(
                    label: Text('Carrots',
                        style: FooderlichTheme.darkTextTheme.bodyLarge),
                    backgroundColor: Colors.black.withOpacity(0.7),
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
